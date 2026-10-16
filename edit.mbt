///|
fn edit_tree(
  value : Value,
  pointer : String,
  replacement : Value?,
  insert : Bool,
  limits : Limits,
) -> Value raise PlistError {
  validate(value, limits~)
  if pointer.length() > limits.max_bytes {
    raise Limit("edit pointer budget")
  }
  let tokens = parse_pointer(pointer)
  if tokens.length() > limits.max_depth {
    raise Limit("edit path depth")
  }
  match replacement {
    Some(v) => validate(v, limits~)
    None => ()
  }
  fn edit(v : Value, depth : Int32) -> Value raise PlistError {
    if depth == tokens.length() {
      return match replacement {
        Some(v) => v
        None => raise PathError("cannot remove document root")
      }
    }
    let token = tokens[depth]
    let last = depth + 1 == tokens.length()
    match v {
      Dict(entries) => {
        let result : Array[(String, Value)] = []
        let mut found = false
        for (key, item) in entries {
          if key == token {
            found = true
            if last {
              match replacement {
                Some(v) => result.push((key, v))
                None => ()
              }
            } else {
              result.push((key, edit(item, depth + 1)))
            }
          } else {
            result.push((key, item))
          }
        }
        if !found {
          match replacement {
            Some(v) if last && insert => result.push((token, v))
            _ => raise PathError("edit key missing")
          }
        }
        Dict(result)
      }
      List(items) => {
        let adding = last && insert && replacement is Some(_)
        let index = array_index(token, items.length(), adding)
        let result : Array[Value] = []
        for i = 0; i < items.length(); i = i + 1 {
          if i == index {
            if last {
              match replacement {
                Some(v) => result.push(v)
                None => ()
              }
              if adding {
                result.push(items[i])
              }
            } else {
              result.push(edit(items[i], depth + 1))
            }
          } else {
            result.push(items[i])
          }
        }
        if adding && index == items.length() {
          match replacement {
            Some(v) => result.push(v)
            None => ()
          }
        }
        List(result)
      }
      _ => raise PathError("edit traverses scalar")
    }
  }
  let result = edit(value, 0)
  validate(result, limits~)
  result
}

///|
/// Functional replacement: missing paths are errors. Input is not mutated.
pub fn replace(
  value : Value,
  pointer : String,
  replacement : Value,
  limits~ : Limits = Limits::default(),
) -> Value raise PlistError {
  edit_tree(value, pointer, Some(replacement), false, limits)
}

///|
/// Dictionary upsert or array insertion; '-' appends to arrays.
pub fn insert(
  value : Value,
  pointer : String,
  replacement : Value,
  limits~ : Limits = Limits::default(),
) -> Value raise PlistError {
  edit_tree(value, pointer, Some(replacement), true, limits)
}

///|
pub fn remove(
  value : Value,
  pointer : String,
  limits~ : Limits = Limits::default(),
) -> Value raise PlistError {
  edit_tree(value, pointer, None, false, limits)
}
