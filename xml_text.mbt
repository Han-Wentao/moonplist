///|
fn xml_char(n : Int32) -> Bool {
  n == 9 ||
  n == 10 ||
  n == 13 ||
  (n >= 32 && n <= 0xd7ff) ||
  (n >= 0xe000 && n <= 0xfffd) ||
  (n >= 0x10000 && n <= 0x10ffff)
}

///|
pub fn escape_xml_text(text : String) -> String raise PlistError {
  let out = StringBuilder()
  for c in text {
    if !xml_char(c.to_int()) {
      raise Invalid("character forbidden by XML 1.0")
    }
    match c {
      '&' => out.write_string("&amp;")
      '<' => out.write_string("&lt;")
      '>' => out.write_string("&gt;")
      '\r' => out.write_string("&#13;")
      _ => out.write_char(c)
    }
  }
  out.to_string()
}

///|
pub fn unescape_xml_text(text : String) -> String raise PlistError {
  let text = text
    .replace_all(old="\r\n", new="\n")
    .replace_all(old="\r", new="\n")
  let out = StringBuilder()
  let mut pos = 0
  while pos < text.length() {
    if text[pos] == 38 {
      let start = pos + 1
      pos = start
      while pos < text.length() && text[pos] != 59 {
        pos += 1
      }
      if pos >= text.length() {
        raise Invalid("unterminated XML entity")
      }
      let name = text[start:pos].to_owned()
      let code = match name {
        "amp" => 38
        "lt" => 60
        "gt" => 62
        "apos" => 39
        "quot" => 34
        _ => {
          if !name.has_prefix("#") {
            raise Invalid("unknown XML entity")
          }
          let hex = name.has_prefix("#x")
          let from = if hex { 2 } else { 1 }
          let base = if hex { 16 } else { 10 }
          if name.length() <= from {
            raise Invalid("empty character reference")
          }
          let mut n = 0
          for i = from; i < name.length(); i = i + 1 {
            let c = name[i].to_int()
            let d = if c >= 48 && c <= 57 {
              c - 48
            } else if hex && c >= 65 && c <= 70 {
              c - 55
            } else if hex && c >= 97 && c <= 102 {
              c - 87
            } else {
              -1
            }
            if d < 0 || n > (0x10ffff - d) / base {
              raise Invalid("invalid character reference")
            }
            n = n * base + d
          }
          n
        }
      }
      if !xml_char(code) {
        raise Invalid("XML character reference out of range")
      }
      match code.to_char() {
        Some(c) => out.write_char(c)
        None => raise Invalid("XML surrogate reference")
      }
      pos += 1
    } else {
      let next = match text.get_char(pos) {
        Some(c) => c
        None => raise Invalid("invalid XML Unicode")
      }
      if !xml_char(next.to_int()) {
        raise Invalid("XML character out of range")
      }
      if next == '<' {
        raise Invalid("unescaped less-than in XML text")
      }
      out.write_char(next)
      pos += if next.to_int() > 0xffff { 2 } else { 1 }
    }
  }
  if text.contains("]]>") {
    raise Invalid("CDATA terminator in ordinary text")
  }
  out.to_string()
}
