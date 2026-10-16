///|
pub(all) enum Format {
  Binary
  Xml
} derive(Eq)

///|
pub extend Format with Eq::{equal, not_equal}

///|
/// Header selection; unsupported OpenStep text is never guessed as a plist.
pub fn detect_format(data : Bytes) -> Format {
  if data.has_prefix(b"bplist00"[:]) {
    Binary
  } else {
    Xml
  }
}

///|
fn xml_bytes(data : Bytes) -> String raise PlistError {
  let n = data.length()
  let be = n >= 2 && data[0] == b'\xfe' && data[1] == b'\xff'
  let le = n >= 2 && data[0] == b'\xff' && data[1] == b'\xfe'
  let guessed_be = n >= 4 &&
    data[0] == b'\x00' &&
    data[1] == b'<' &&
    data[2] == b'\x00' &&
    data[3] != b'\x00'
  let guessed_le = n >= 4 &&
    data[0] == b'<' &&
    data[1] == b'\x00' &&
    data[2] != b'\x00' &&
    data[3] == b'\x00'
  if be || le || guessed_be || guessed_le {
    let start = if be || le { 2 } else { 0 }
    if (n - start) % 2 != 0 {
      raise Invalid("odd UTF16 XML byte length")
    }
    if be || guessed_be {
      return binary_text(data, start, (n - start) / 2, true, n)
    }
    let out = @buffer.Buffer()
    for i = start; i < n; i = i + 2 {
      out.write_byte(data[i + 1])
      out.write_byte(data[i])
    }
    return binary_text(out.to_bytes(), 0, (n - start) / 2, true, n - start)
  }
  @utf8.decode(data[:]) catch {
    _ => raise Invalid("XML must be UTF8 or UTF16")
  }
}

///|
pub fn decode(
  data : Bytes,
  limits~ : Limits = Limits::default(),
) -> Value raise PlistError {
  limits.check()
  if data.length() > limits.max_bytes {
    raise Limit("input byte budget")
  }
  match detect_format(data) {
    Binary => decode_binary(data, limits~)
    Xml => decode_xml(xml_bytes(data), limits~)
  }
}

///|
pub fn encode(
  value : Value,
  format : Format,
  limits~ : Limits = Limits::default(),
) -> Bytes raise PlistError {
  match format {
    Binary => encode_binary(value, limits~)
    Xml => @utf8.encode(encode_xml(value, limits~)[:])
  }
}

///|
pub fn convert(
  data : Bytes,
  format : Format,
  limits~ : Limits = Limits::default(),
) -> Bytes raise PlistError {
  encode(decode(data, limits~), format, limits~)
}
