///|
/// Produce a deterministic semantic patch; array changes replace the array.
/// Dictionary order alone produces no operations. Input trees are validated.
pub fn diff(
  before : Value,
  after : Value,
  limits~ : Limits = Limits::default(),
) -> Array[Patch] raise PlistError {
  validate(before, limits~)
  validate(after, limits~)
  let result : Array[Patch] = []
  fn append(op : Patch) -> Unit raise PlistError {
    if result.length() >= limits.max_items {
      raise Limit("diff operation budget")
    }
    result.push(op)
  }
  fn walk(a : Value, b : Value, path : String) -> Unit raise PlistError {
    if equivalent(a, b) {
      return
    }
    match (a, b) {
      (Dict(old), Dict(fresh)) => {
        for (key, _) in old {
          if b.get(key) == None {
            append(Remove(path + format_pointer([key])))
          }
        }
        for (key, value) in fresh {
          let child = path + format_pointer([key])
          match a.get(key) {
            None => append(Add(child, value))
            Some(previous) => walk(previous, value, child)
          }
        }
      }
      _ => append(Replace(path, b))
    }
  }
  walk(before, after, "")
  result
}
