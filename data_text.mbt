///|
/// Strict base64 encoder used by XML data nodes.
pub fn encode_base64(data : Bytes) -> String {
  let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
  let out = StringBuilder()
  let mut i = 0
  while i < data.length() {
    let a = data[i].to_int()
    let b = if i + 1 < data.length() { data[i + 1].to_int() } else { 0 }
    let c = if i + 2 < data.length() { data[i + 2].to_int() } else { 0 }
    out.write_char(alphabet[a >> 2].unsafe_to_char())
    out.write_char(alphabet[((a & 3) << 4) | (b >> 4)].unsafe_to_char())
    if i + 1 < data.length() {
      out.write_char(alphabet[((b & 15) << 2) | (c >> 6)].unsafe_to_char())
    } else {
      out.write_char('=')
    }
    if i + 2 < data.length() {
      out.write_char(alphabet[c & 63].unsafe_to_char())
    } else {
      out.write_char('=')
    }
    i += 3
  }
  out.to_string()
}

///|
fn base64_digit(c : Int32) -> Int32 {
  if c >= 65 && c <= 90 {
    c - 65
  } else if c >= 97 && c <= 122 {
    c - 71
  } else if c >= 48 && c <= 57 {
    c + 4
  } else if c == 43 {
    62
  } else if c == 47 {
    63
  } else {
    -1
  }
}

///|
pub fn decode_base64(
  text : String,
  limits~ : Limits = Limits::default(),
) -> Bytes raise PlistError {
  limits.check()
  if text.length() > limits.max_bytes {
    raise Limit("base64 input budget")
  }
  let chars : Array[Int32] = []
  for c in text {
    let n = c.to_int()
    if n != 32 && n != 9 && n != 10 && n != 13 {
      chars.push(n)
    }
  }
  if chars.length() % 4 != 0 {
    raise Invalid("base64 length")
  }
  let out = @buffer.Buffer()
  let mut i = 0
  while i < chars.length() {
    let a = base64_digit(chars[i])
    let b = base64_digit(chars[i + 1])
    let c = base64_digit(chars[i + 2])
    let d = base64_digit(chars[i + 3])
    if a < 0 || b < 0 {
      raise Invalid("base64 alphabet")
    }
    let last = i + 4 == chars.length()
    if chars[i + 2] == 61 {
      if !last || chars[i + 3] != 61 || (b & 15) != 0 {
        raise Invalid("base64 padding")
      }
      out.write_byte(((a << 2) | (b >> 4)).to_byte())
    } else if chars[i + 3] == 61 {
      if !last || c < 0 || (c & 3) != 0 {
        raise Invalid("base64 padding")
      }
      out.write_byte(((a << 2) | (b >> 4)).to_byte())
      out.write_byte(((b << 4) | (c >> 2)).to_byte())
    } else {
      if c < 0 || d < 0 {
        raise Invalid("base64 alphabet")
      }
      out.write_byte(((a << 2) | (b >> 4)).to_byte())
      out.write_byte(((b << 4) | (c >> 2)).to_byte())
      out.write_byte(((c << 6) | d).to_byte())
    }
    i += 4
  }
  out.to_bytes()
}

///|
pub fn encode_hex(data : Bytes) -> String {
  let alphabet = "0123456789abcdef"
  let out = StringBuilder()
  for b in data {
    out.write_char(alphabet[b.to_int() >> 4].unsafe_to_char())
    out.write_char(alphabet[b.to_int() & 15].unsafe_to_char())
  }
  out.to_string()
}

///|
pub fn decode_hex(
  text : String,
  limits~ : Limits = Limits::default(),
) -> Bytes raise PlistError {
  limits.check()
  if text.length() > limits.max_bytes || text.length() % 2 != 0 {
    raise Limit("hex length or budget")
  }
  fn digit(c : Int32) -> Int32 raise PlistError {
    if c >= 48 && c <= 57 {
      c - 48
    } else if c >= 65 && c <= 70 {
      c - 55
    } else if c >= 97 && c <= 102 {
      c - 87
    } else {
      raise Invalid("hex digit")
    }
  }
  let out = @buffer.Buffer()
  let mut i = 0
  while i < text.length() {
    out.write_byte(
      ((digit(text[i].to_int()) << 4) | digit(text[i + 1].to_int())).to_byte(),
    )
    i += 2
  }
  out.to_bytes()
}
