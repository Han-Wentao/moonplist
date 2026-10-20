///|
pub(all) struct BinaryInfo {
  object_count : Int32
  root_id : Int32
  offset_table : Int32
  offset_width : Int32
  reference_width : Int32
}

///|
fn read_uint(
  data : Bytes,
  pos : Int32,
  width : Int32,
  end : Int32,
) -> UInt64 raise PlistError {
  if pos < 0 ||
    width < 1 ||
    width > 8 ||
    end > data.length() ||
    pos > end ||
    width > end - pos {
    raise Invalid("truncated binary integer")
  }
  let mut n = 0UL
  for i = pos; i < pos + width; i = i + 1 {
    n = (n << 8) | data[i].to_uint64()
  }
  n
}

///|
fn bounded_int(
  n : UInt64,
  bound : Int32,
  what : String,
) -> Int32 raise PlistError {
  if n > bound.to_uint64() {
    raise Limit(what)
  }
  n.to_int()
}

///|
fn valid_width(n : Int32) -> Bool {
  n >= 1 && n <= 8
}

///|
/// Validates the trailer and every object offset without decoding values.
pub fn inspect_binary(
  data : Bytes,
  limits~ : Limits = Limits::default(),
) -> BinaryInfo raise PlistError {
  limits.check()
  if data.length() > limits.max_bytes {
    raise Limit("binary byte budget")
  }
  if data.length() < 41 || data[0:8] != b"bplist00"[:] {
    raise Invalid("expected bplist00 header and trailer")
  }
  let t = data.length() - 32
  let ow = data[t + 6].to_int()
  let rw = data[t + 7].to_int()
  if !valid_width(ow) || !valid_width(rw) {
    raise Invalid("binary offset/reference width")
  }
  let count = bounded_int(
    read_uint(data, t + 8, 8, data.length()),
    limits.max_objects,
    "binary object count",
  )
  if count == 0 {
    raise Invalid("empty binary object table")
  }
  let root = bounded_int(
    read_uint(data, t + 16, 8, data.length()),
    count - 1,
    "root reference",
  )
  let table = bounded_int(
    read_uint(data, t + 24, 8, data.length()),
    t,
    "offset table position",
  )
  if table < 9 || count > (t - table) / ow || table + count * ow != t {
    raise Invalid("offset table size")
  }
  for i = 0; i < count; i = i + 1 {
    let off = bounded_int(
      read_uint(data, table + i * ow, ow, t),
      table - 1,
      "object offset",
    )
    if off < 8 {
      raise Invalid("object overlaps header")
    }
  }
  {
    object_count: count,
    root_id: root,
    offset_table: table,
    offset_width: ow,
    reference_width: rw,
  }
}
