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
  let pos = read_uint(
    data,
    info.offset_table + info.root_id * info.offset_width,
    info.offset_width,
    data.length() - 32,
  ).to_int()
  decode_scalar(data, data[pos].to_int(), pos + 1, info.offset_table, limits)
}
