///|
priv enum XmlToken {
  Open(String, Bool)
  Close(String)
  Content(String)
  End
}

///|
priv struct XmlReader {
  text : String
  mut pos : Int32
  limits : Limits
  mut nodes : Int32
}

///|
fn XmlReader::starts(self : XmlReader, s : String) -> Bool {
  self.text[self.pos:].has_prefix(s[:])
}

///|
fn XmlReader::space(self : XmlReader) -> Unit {
  while self.pos < self.text.length() {
    let c = self.text[self.pos].to_int()
    if c != 32 && c != 9 && c != 10 && c != 13 {
      break
    }
    self.pos += 1
  }
}

///|
fn XmlReader::name(self : XmlReader) -> String raise PlistError {
  let start = self.pos
  while self.pos < self.text.length() {
    let c = self.text[self.pos].to_int()
    if !((c >= 65 && c <= 90) ||
      (c >= 97 && c <= 122) ||
      (c >= 48 && c <= 57) ||
      c == 45 ||
      c == 95) {
      break
    }
    self.pos += 1
  }
  if self.pos == start {
    raise Invalid("missing XML name")
  }
  self.text[start:self.pos].to_owned()
}

///|
fn XmlReader::next(
  self : XmlReader,
  preamble~ : Bool = false,
) -> XmlToken raise PlistError {
  while true {
    if self.pos >= self.text.length() {
      return End
    }
    if self.starts("<!--") {
      self.pos += 4
      while !self.starts("-->") {
        if self.pos >= self.text.length() || self.starts("--") {
          raise Invalid("invalid XML comment")
        }
        self.pos += 1
      }
      self.pos += 3
      continue
    }
    if self.starts("<?") {
      self.pos += 2
      while !self.starts("?>") {
        if self.pos >= self.text.length() {
          raise Invalid("unterminated processing instruction")
        }
        self.pos += 1
      }
      self.pos += 2
      continue
    }
    if self.starts("<!DOCTYPE") {
      if !preamble {
        raise Invalid("DOCTYPE outside preamble")
      }
      self.pos += 9
      self.space()
      if self.name() != "plist" {
        raise Invalid("DOCTYPE root must be plist")
      }
      let mut quoted = 0
      while self.pos < self.text.length() {
        let c = self.text[self.pos].to_int()
        if c == 91 {
          raise Unsupported("XML internal DTD declarations disabled")
        }
        if quoted == 0 && c == 62 {
          break
        }
        if c == 34 || c == 39 {
          if quoted == 0 {
            quoted = c
          } else if quoted == c {
            quoted = 0
          }
        }
        self.pos += 1
      }
      if self.pos >= self.text.length() {
        raise Invalid("unterminated DOCTYPE")
      }
      self.pos += 1
      continue
    }
    if self.text[self.pos] != 60 {
      let start = self.pos
      while self.pos < self.text.length() && self.text[self.pos] != 60 {
        self.pos += 1
      }
      return Content(unescape_xml_text(self.text[start:self.pos].to_owned()))
    }
    self.pos += 1
    if self.pos < self.text.length() && self.text[self.pos] == 47 {
      self.pos += 1
      let name = self.name()
      self.space()
      if self.pos >= self.text.length() || self.text[self.pos] != 62 {
        raise Invalid("malformed closing tag")
      }
      self.pos += 1
      return Close(name)
    }
    let name = self.name()
    let mut version = false
    while true {
      let before = self.pos
      self.space()
      if self.pos >= self.text.length() {
        raise Invalid("truncated start tag")
      }
      if self.text[self.pos] == 62 {
        self.pos += 1
        return Open(name, false)
      }
      if self.starts("/>") {
        self.pos += 2
        return Open(name, true)
      }
      if self.pos == before || name != "plist" || version {
        raise Invalid("unexpected XML attribute")
      }
      if self.name() != "version" {
        raise Invalid("unknown plist attribute")
      }
      self.space()
      if self.pos >= self.text.length() || self.text[self.pos] != 61 {
        raise Invalid("missing attribute equals")
      }
      self.pos += 1
      self.space()
      if self.pos >= self.text.length() {
        raise Invalid("missing attribute quote")
      }
      let q = self.text[self.pos]
      if q != 34 && q != 39 {
        raise Invalid("unquoted attribute")
      }
      self.pos += 1
      let start = self.pos
      while self.pos < self.text.length() && self.text[self.pos] != q {
        self.pos += 1
      }
      if self.pos >= self.text.length() || self.text[start:self.pos] != "1.0"[:] {
        raise Unsupported("plist version must be 1.0")
      }
      self.pos += 1
      version = true
    }
  }
  raise Invalid("unexpected XML end")
}

///|
fn XmlReader::nonspace(
  self : XmlReader,
  preamble~ : Bool = false,
) -> XmlToken raise PlistError {
  while true {
    match self.next(preamble~) {
      Content(s) if s.all(c => c == ' ' || c == '\t' || c == '\n' || c == '\r') =>
        continue
      token => return token
    }
  }
  raise Invalid("unexpected XML end")
}

///|
fn XmlReader::scalar(
  self : XmlReader,
  tag : String,
  empty : Bool,
) -> String raise PlistError {
  if empty {
    return ""
  }
  let out = StringBuilder()
  while true {
    match self.next() {
      Content(text) => out.write_string(text)
      Close(name) if name == tag => return out.to_string()
      _ => raise Invalid("scalar closing tag mismatch")
    }
  }
  raise Invalid("unexpected XML end")
}

///|
fn xml_integer(text : String) -> Value raise PlistError {
  let t = text.trim()
  if t.is_empty() {
    raise Invalid("empty integer")
  }
  let signed : Int64? = Some(@string.parse_int64(t, base=10)) catch {
    _ => None
  }
  match signed {
    Some(n) => Integer(n)
    None => {
      let n = @string.parse_uint64(t, base=10) catch {
        _ => raise Invalid("integer outside supported 64-bit range")
      }
      if n <= 9223372036854775807UL {
        raise Invalid("invalid integer spelling")
      }
      Unsigned(n)
    }
  }
}

///|
fn XmlReader::value(
  self : XmlReader,
  token : XmlToken,
  depth : Int32,
) -> Value raise PlistError {
  if depth > self.limits.max_depth {
    raise Limit("XML nesting budget")
  }
  self.nodes += 1
  if self.nodes > self.limits.max_objects {
    raise Limit("XML object budget")
  }
  let (tag, empty) = match token {
    Open(tag, empty) => (tag, empty)
    _ => raise Invalid("expected plist value element")
  }
  if tag == "array" {
    let items : Array[Value] = []
    if !empty {
      while true {
        match self.nonspace() {
          Close("array") => break
          token => {
            if items.length() >= self.limits.max_items {
              raise Limit("XML array item budget")
            }
            items.push(self.value(token, depth + 1))
          }
        }
      }
    }
    return List(items)
  }
  if tag == "dict" {
    let entries : Array[(String, Value)] = []
    let keys : Map[String, Bool] = Map([])
    if !empty {
      while true {
        match self.nonspace() {
          Close("dict") => break
          Open("key", closed) => {
            if entries.length() >= self.limits.max_items {
              raise Limit("XML dictionary item budget")
            }
            self.nodes += 1
            if self.nodes > self.limits.max_objects {
              raise Limit("XML key object budget")
            }
            let key = self.scalar("key", closed)
            if keys.contains(key) {
              raise Invalid("duplicate XML dictionary key")
            }
            keys[key] = true
            entries.push((key, self.value(self.nonspace(), depth + 1)))
          }
          _ => raise Invalid("expected dictionary key or closing dict")
        }
      }
    }
    return Dict(entries)
  }
  let text = self.scalar(tag, empty)
  match tag {
    "string" => Text(text)
    "integer" => xml_integer(text)
    "real" => {
      let d = @string.parse_double(text.trim()) catch {
        _ => raise Invalid("invalid real")
      }
      Real(d)
    }
    "true" | "false" => {
      if !text.is_empty() {
        raise Invalid("boolean must have empty content")
      }
      Boolean(tag == "true")
    }
    "data" => Data(decode_base64(text, limits=self.limits))
    "date" => Date(parse_date(text.trim().to_owned()))
    _ => raise Unsupported("XML value type")
  }
}

///|
pub fn decode_xml(
  text : String,
  limits~ : Limits = Limits::default(),
) -> Value raise PlistError {
  limits.check()
  if text.length() > limits.max_bytes {
    raise Limit("XML text budget")
  }
  let reader : XmlReader = {
    text,
    pos: if text.has_prefix("\u{feff}") {
      1
    } else {
      0
    },
    limits,
    nodes: 0,
  }
  match reader.nonspace(preamble=true) {
    Open("plist", false) => ()
    _ => raise Invalid("expected plist root")
  }
  let value = reader.value(reader.nonspace(), 0)
  match reader.nonspace() {
    Close("plist") => ()
    _ => raise Invalid("expected closing plist")
  }
  match reader.nonspace() {
    End => ()
    _ => raise Invalid("trailing XML document content")
  }
  value
}
