///|
fn binary_length(
  data : Bytes,
  pos : Int32,
  nibble : Int32,
  end : Int32,
  limits : Limits,
) -> (Int32, Int32) raise PlistError {
  if nibble < 15 {
    return (nibble, pos)
  }
  if pos >= end || data[pos].to_int() >> 4 != 1 {
    raise Invalid("extended length requires integer")
  }
  let power = data[pos].to_int() & 15
  if power > 3 {
    raise Limit("extended length width")
  }
  let width = 1 << power
  let count = bounded_int(
    read_uint(data, pos + 1, width, end),
    limits.max_bytes,
    "binary length budget",
  )
  (count, pos + 1 + width)
}

///|
fn binary_text(
  data : Bytes,
  pos : Int32,
  count : Int32,
  wide : Bool,
  end : Int32,
) -> String raise PlistError {
  let width = if wide { 2 } else { 1 }
  if pos > end || count > (end - pos) / width {
    raise Invalid("truncated binary string")
  }
  let out = StringBuilder()
  let mut i = 0
  while i < count {
    let n = read_uint(data, pos + i * width, width, end).to_int()
    if !wide && n > 127 {
      raise Invalid("non-ASCII byte in ASCII string")
    }
    if n >= 0xd800 && n <= 0xdbff {
      if i + 1 >= count {
        raise Invalid("unpaired UTF16 high surrogate")
      }
      let low = read_uint(data, pos + (i + 1) * width, width, end).to_int()
      if low < 0xdc00 || low > 0xdfff {
        raise Invalid("invalid UTF16 surrogate pair")
      }
      match (0x10000 + ((n - 0xd800) << 10) + low - 0xdc00).to_char() {
        Some(c) => out.write_char(c)
        None => raise Invalid("invalid Unicode scalar")
      }
      i += 2
    } else {
      match n.to_char() {
        Some(c) => out.write_char(c)
        None => raise Invalid("unpaired UTF16 low surrogate")
      }
      i += 1
    }
  }
  out.to_string()
}

///|
fn decode_scalar(
  data : Bytes,
  marker : Int32,
  pos : Int32,
  end : Int32,
  limits : Limits,
) -> Value raise PlistError {
  let kind = marker >> 4
  let low = marker & 15
  match kind {
    0 =>
      match low {
        0 => Null
        8 => Boolean(false)
        9 => Boolean(true)
        _ => raise Unsupported("binary simple object marker")
      }
    1 => {
      if low > 4 {
        raise Unsupported("integer wider than 128 bits")
      }
      let width = 1 << low
      if width == 16 {
        if read_uint(data, pos, 8, end) != 0UL {
          raise Unsupported("integer outside uint64 range")
        }
        let n = read_uint(data, pos + 8, 8, end)
        if n > 9223372036854775807UL {
          Unsigned(n)
        } else {
          Integer(n.reinterpret_as_int64())
        }
      } else {
        let n = read_uint(data, pos, width, end)
        Integer(n.reinterpret_as_int64())
      }
    }
    2 =>
      if low == 2 {
        Real(
          Float::reinterpret_from_int(read_uint(data, pos, 4, end).to_int()).to_double(),
        )
      } else if low == 3 {
        Real(read_uint(data, pos, 8, end).reinterpret_as_double())
      } else {
        raise Unsupported("real must be 32 or 64 bits")
      }
    3 => {
      if low != 3 {
        raise Invalid("date marker must be 0x33")
      }
      let d = read_uint(data, pos, 8, end).reinterpret_as_double()
      if d.is_nan() || d.is_inf() {
        raise Invalid("date must be finite")
      }
      Date(d)
    }
    4 | 5 | 6 => {
      let (count, start) = binary_length(data, pos, low, end, limits)
      if kind == 4 {
        if start > end || count > end - start {
          raise Invalid("truncated data")
        }
        Data(Bytes::from_array(data[start:start + count].to_array()[:]))
      } else {
        Text(binary_text(data, start, count, kind == 6, end))
      }
    }
    8 => {
      if low > 7 {
        raise Unsupported("UID wider than 64 bits")
      }
      Uid(read_uint(data, pos, low + 1, end))
    }
    _ => raise Unsupported("binary object marker")
  }
}

///|
pub fn decode_binary(
  data : Bytes,
  limits~ : Limits = Limits::default(),
) -> Value raise PlistError {
  let info = inspect_binary(data, limits~)
  let active = Array::make(info.object_count, false)
  let visits = Ref(0)
  fn decode(id : Int32, depth : Int32) -> Value raise PlistError {
    if depth > limits.max_depth {
      raise Limit("binary nesting budget")
    }
    visits.val += 1
    if visits.val > limits.max_objects {
      raise Limit("expanded binary object budget")
    }
    if id < 0 || id >= info.object_count {
      raise Invalid("object reference out of range")
    }
    if active[id] {
      raise Invalid("cyclic binary object graph")
    }
    let pos = read_uint(
      data,
      info.offset_table + id * info.offset_width,
      info.offset_width,
      data.length() - 32,
    ).to_int()
    let marker = data[pos].to_int()
    let kind = marker >> 4
    if kind != 10 && kind != 13 {
      return decode_scalar(data, marker, pos + 1, info.offset_table, limits)
    }
    active[id] = true
    let (count, start) = binary_length(
      data,
      pos + 1,
      marker & 15,
      info.offset_table,
      limits,
    )
    if count > limits.max_items {
      raise Limit("binary container budget")
    }
    let groups = if kind == 13 { 2 } else { 1 }
    if count > (info.offset_table - start) / info.reference_width / groups {
      raise Invalid("truncated container references")
    }
    fn reference(index : Int32) -> Int32 raise PlistError {
      bounded_int(
        read_uint(
          data,
          start + index * info.reference_width,
          info.reference_width,
          info.offset_table,
        ),
        info.object_count - 1,
        "container reference",
      )
    }
    let result = if kind == 10 {
      let values : Array[Value] = []
      for i = 0; i < count; i = i + 1 {
        values.push(decode(reference(i), depth + 1))
      }
      Value::List(values)
    } else {
      let entries : Array[(String, Value)] = []
      let keys : Map[String, Bool] = Map([])
      for i = 0; i < count; i = i + 1 {
        let key = match decode(reference(i), depth + 1) {
          Text(key) => key
          _ => raise Invalid("dictionary key is not a string")
        }
        if keys.contains(key) {
          raise Invalid("duplicate binary dictionary key")
        }
        keys[key] = true
        entries.push((key, decode(reference(count + i), depth + 1)))
      }
      Value::Dict(entries)
    }
    active[id] = false
    result
  }
  decode(info.root_id, 0)
}
