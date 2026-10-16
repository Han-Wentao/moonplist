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
  let out = @buffer.Buffer()
  out.write_bytes(b"bplist00"[:])
  encode_scalar(out, value)
  let table = out.length()
  let ow = uint_width(table.to_uint64())
  write_uint(out, 8UL, ow)
  for i = 0; i < 6; i = i + 1 {
    out.write_byte(b'\x00')
  }
  out.write_byte(ow.to_byte())
  out.write_byte(b'\x01')
  write_uint(out, 1UL, 8)
  write_uint(out, 0UL, 8)
  write_uint(out, table.to_uint64(), 8)
  if out.length() > limits.max_bytes {
    raise Limit("encoded binary byte budget")
  }
  out.to_bytes()
}
