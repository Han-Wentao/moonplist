///|
fn uint_width(n : UInt64) -> Int32 {
  if n <= 255UL {
    1
  } else if n <= 65535UL {
    2
  } else if n <= 4294967295UL {
    4
  } else {
    8
  }
}

///|
fn write_uint(out : @buffer.Buffer, n : UInt64, width : Int32) -> Unit {
  for i = width - 1; i >= 0; i = i - 1 {
    out.write_byte((n >> (i * 8)).to_byte())
  }
}

///|
fn width_power(width : Int32) -> Int32 {
  match width {
    1 => 0
    2 => 1
    4 => 2
    _ => 3
  }
}

///|
fn write_length(out : @buffer.Buffer, kind : Int32, n : Int32) -> Unit {
  if n < 15 {
    out.write_byte((kind | n).to_byte())
  } else {
    out.write_byte((kind | 15).to_byte())
    let width = uint_width(n.to_uint64())
    out.write_byte((0x10 | width_power(width)).to_byte())
    write_uint(out, n.to_uint64(), width)
  }
}

///|
fn encode_scalar(out : @buffer.Buffer, value : Value) -> Unit raise PlistError {
  match value {
    Null => out.write_byte(b'\x00')
    Boolean(b) => out.write_byte(if b { b'\x09' } else { b'\x08' })
    Integer(n) => {
      let width = if n < 0L { 8 } else { uint_width(n.reinterpret_as_uint64()) }
      out.write_byte((0x10 | width_power(width)).to_byte())
      write_uint(out, n.reinterpret_as_uint64(), width)
    }
    Unsigned(n) => {
      out.write_byte(b'\x14')
      write_uint(out, 0UL, 8)
      write_uint(out, n, 8)
    }
    Real(d) => {
      out.write_byte(b'\x23')
      out.write_double_be(d)
    }
    Date(d) => {
      out.write_byte(b'\x33')
      out.write_double_be(d)
    }
    Data(data) => {
      write_length(out, 0x40, data.length())
      out.write_bytes(data[:])
    }
    Text(text) => {
      let ascii = text.all(c => c.to_int() < 128)
      write_length(out, if ascii { 0x50 } else { 0x60 }, text.length())
      if ascii {
        for c in text {
          out.write_byte(c.to_int().to_byte())
        }
      } else {
        out.write_string_utf16be(text[:])
      }
    }
    Uid(n) => {
      let width = uint_width(n)
      out.write_byte((0x80 | (width - 1)).to_byte())
      write_uint(out, n, width)
    }
    List(_) | Dict(_) => raise Unsupported("container requires object table")
  }
}

///|
/// Deterministic tree writer; repeated values need not share binary object IDs.
pub fn encode_binary(
  value : Value,
  limits~ : Limits = Limits::default(),
) -> Bytes raise PlistError {
  validate(value, limits~)
  let objects : Array[(Value, Array[Int32])] = []
  fn flatten(v : Value) -> Int32 raise PlistError {
    if objects.length() >= limits.max_objects {
      raise Limit("binary writer object budget")
    }
    let id = objects.length()
    let refs : Array[Int32] = []
    objects.push((v, refs))
    match v {
      List(items) =>
        for item in items {
          refs.push(flatten(item))
        }
      Dict(entries) => {
        for entry in entries {
          refs.push(flatten(Text(entry.0)))
        }
        for entry in entries {
          refs.push(flatten(entry.1))
        }
      }
      _ => ()
    }
    id
  }
  let root = flatten(value)
  // Core Foundation requires the width to represent the count, not only the last ID.
  let rw = uint_width(objects.length().to_uint64())
  let offsets : Array[Int32] = []
  let out = @buffer.Buffer()
  out.write_bytes(b"bplist00"[:])
  for (v, refs) in objects {
    offsets.push(out.length())
    match v {
      List(items) => {
        write_length(out, 0xa0, items.length())
        for id in refs {
          write_uint(out, id.to_uint64(), rw)
        }
      }
      Dict(entries) => {
        write_length(out, 0xd0, entries.length())
        for id in refs {
          write_uint(out, id.to_uint64(), rw)
        }
      }
      _ => encode_scalar(out, v)
    }
    if out.length() > limits.max_bytes {
      raise Limit("binary object byte budget")
    }
  }
  let table = out.length()
  let ow = uint_width(table.to_uint64())
  if offsets.length() > (limits.max_bytes - table - 32) / ow {
    raise Limit("binary trailer byte budget")
  }
  for off in offsets {
    write_uint(out, off.to_uint64(), ow)
  }
  for i = 0; i < 6; i = i + 1 {
    out.write_byte(b'\x00')
  }
  out.write_byte(ow.to_byte())
  out.write_byte(rw.to_byte())
  write_uint(out, objects.length().to_uint64(), 8)
  write_uint(out, root.to_uint64(), 8)
  write_uint(out, table.to_uint64(), 8)
  if out.length() > limits.max_bytes {
    raise Limit("encoded binary byte budget")
  }
  out.to_bytes()
}
