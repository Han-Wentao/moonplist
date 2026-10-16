///|
/// RFC 6901 escaping only; array indices are interpreted during traversal.
pub fn parse_pointer(pointer : String) -> Array[String] raise PlistError {
  if pointer.is_empty() {
    return []
  }
  if !pointer.has_prefix("/") {
    raise PathError("pointer must start with slash")
  }
  let tokens : Array[String] = []
  for raw in pointer[1:].split("/") {
    let out = StringBuilder()
    let s = raw.to_owned()
    let mut i = 0
    while i < s.length() {
      if s[i] == 126 {
        if i + 1 >= s.length() {
          raise PathError("truncated pointer escape")
        }
        match s[i + 1].to_int() {
          48 => out.write_char('~')
          49 => out.write_char('/')
          _ => raise PathError("pointer escape must be tilde-zero or tilde-one")
        }
        i += 2
      } else {
        let c = match s.get_char(i) {
          Some(c) => c
          None => raise PathError("invalid pointer Unicode")
        }
        out.write_char(c)
        i += if c.to_int() > 0xffff { 2 } else { 1 }
      }
    }
    tokens.push(out.to_string())
  }
  tokens
}

///|
pub fn format_pointer(tokens : Array[String]) -> String {
  let out = StringBuilder()
  for token in tokens {
    out.write_char('/')
    out.write_string(
      token.replace_all(old="~", new="~0").replace_all(old="/", new="~1"),
    )
  }
  out.to_string()
}

///|
fn array_index(
  token : String,
  length : Int32,
  append : Bool,
) -> Int32 raise PlistError {
  if append && token == "-" {
    return length
  }
  if token.is_empty() || (token.length() > 1 && token[0] == 48) {
    raise PathError("invalid array index spelling")
  }
  let mut n = 0
  for c in token {
    let d = c.to_int() - 48
    if d < 0 || d > 9 || n > (2147483647 - d) / 10 {
      raise PathError("array index overflow or syntax")
    }
    n = n * 10 + d
  }
  if n > length || (!append && n == length) {
    raise PathError("array index out of bounds")
  }
  n
}

///|
pub fn lookup(
  value : Value,
  pointer : String,
  limits~ : Limits = Limits::default(),
) -> Value raise PlistError {
  limits.check()
  if pointer.length() > limits.max_bytes {
    raise Limit("pointer byte budget")
  }
  let tokens = parse_pointer(pointer)
  if tokens.length() > limits.max_depth {
    raise Limit("pointer depth budget")
  }
  let mut v = value
  for token in tokens {
    v = match v {
      Dict(_) =>
        match v.get(token) {
          Some(item) => item
          None => raise PathError("dictionary key missing")
        }
      List(items) => items[array_index(token, items.length(), false)]
      _ => raise PathError("pointer traverses scalar")
    }
  }
  v
}
