///|
/// A batch either returns its complete result or raises without mutating input.
pub(all) enum Patch {
  Add(String, Value)
  Replace(String, Value)
  Remove(String)
  Test(String, Value)
  Copy(String, String)
  Move(String, String)
}

///|
/// Dictionary order is ignored; numeric types remain distinct. NaNs compare equal.
pub fn equivalent(left : Value, right : Value) -> Bool {
  match (left, right) {
    (Real(a), Real(b)) => a == b || (a.is_nan() && b.is_nan())
    (List(a), List(b)) => {
      if a.length() != b.length() {
        return false
      }
      for i = 0; i < a.length(); i = i + 1 {
        if !equivalent(a[i], b[i]) {
          return false
        }
      }
      true
    }
    (Dict(a), Dict(b)) => {
      if a.length() != b.length() {
        return false
      }
      for (key, value) in a {
        match right.get(key) {
          Some(v) => if !equivalent(value, v) { return false }
          None => return false
        }
      }
      true
    }
    _ => left == right
  }
}

///|
pub fn apply_patch(
  value : Value,
  operations : Array[Patch],
  limits~ : Limits = Limits::default(),
) -> Value raise PlistError {
  validate(value, limits~)
  if operations.length() > limits.max_items {
    raise Limit("patch operation budget")
  }
  let mut result = value
  for operation in operations {
    result = match operation {
      Add(path, v) => insert(result, path, v, limits~)
      Replace(path, v) => replace(result, path, v, limits~)
      Remove(path) => remove(result, path, limits~)
      Test(path, expected) => {
        validate(expected, limits~)
        if !equivalent(lookup(result, path, limits~), expected) {
          raise PathError("patch test failed")
        }
        result
      }
      Copy(source, target) =>
        insert(result, target, lookup(result, source, limits~), limits~)
      Move(source, target) => {
        let item = lookup(result, source, limits~)
        let from = parse_pointer(source)
        let dest = parse_pointer(target)
        let mut prefix = from.length() < dest.length()
        if prefix {
          for i = 0; i < from.length(); i = i + 1 {
            if from[i] != dest[i] {
              prefix = false
            }
          }
        }
        if prefix {
          raise PathError("cannot move into descendant")
        }
        if source == target {
          result
        } else {
          insert(remove(result, source, limits~), target, item, limits~)
        }
      }
    }
  }
  result
}
