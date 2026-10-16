///|
/// XML has no null or UID representation; these fail instead of losing types.
pub fn encode_xml(
  value : Value,
  pretty~ : Bool = true,
  limits~ : Limits = Limits::default(),
) -> String raise PlistError {
  validate(value, limits~)
  let out = StringBuilder()
  let bytes = Ref(0)
  fn put(text : String) -> Unit raise PlistError {
    let n = @utf8.encode(text[:]).length()
    if n > limits.max_bytes - bytes.val {
      raise Limit("XML output byte budget")
    }
    bytes.val += n
    out.write_string(text)
  }
  fn indent(depth : Int32) -> Unit raise PlistError {
    if pretty {
      for i = 0; i < depth; i = i + 1 {
        put("  ")
      }
    }
  }
  fn newline() -> Unit raise PlistError {
    if pretty {
      put("\n")
    }
  }
  fn scalar(
    tag : String,
    text : String,
    depth : Int32,
  ) -> Unit raise PlistError {
    indent(depth)
    put("<" + tag + ">")
    put(text)
    put("</" + tag + ">")
    newline()
  }
  fn write(v : Value, depth : Int32) -> Unit raise PlistError {
    match v {
      Null | Uid(_) =>
        raise Unsupported("null and UID are binary-only plist types")
      Boolean(b) => {
        indent(depth)
        put(if b { "<true/>" } else { "<false/>" })
        newline()
      }
      Integer(n) => scalar("integer", n.to_string(), depth)
      Unsigned(n) => scalar("integer", n.to_string(), depth)
      Real(d) => {
        let text = if d.is_nan() {
          "nan"
        } else if d.is_pos_inf() {
          "inf"
        } else if d.is_neg_inf() {
          "-inf"
        } else {
          d.to_string()
        }
        scalar("real", text, depth)
      }
      Text(text) => scalar("string", escape_xml_text(text), depth)
      Data(data) => scalar("data", encode_base64(data), depth)
      Date(d) => scalar("date", format_date(d), depth)
      List(items) => {
        indent(depth)
        put("<array>")
        newline()
        for item in items {
          write(item, depth + 1)
        }
        indent(depth)
        put("</array>")
        newline()
      }
      Dict(entries) => {
        indent(depth)
        put("<dict>")
        newline()
        for (key, item) in entries {
          scalar("key", escape_xml_text(key), depth + 1)
          write(item, depth + 1)
        }
        indent(depth)
        put("</dict>")
        newline()
      }
    }
  }
  put("<?xml version=\"1.0\" encoding=\"UTF-8\"?>")
  newline()
  put("<plist version=\"1.0\">")
  newline()
  write(value, 1)
  put("</plist>")
  newline()
  out.to_string()
}
