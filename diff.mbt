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
  fn append(op : Patch, path : String) -> Unit raise PlistError {
    if path.length() > limits.max_bytes {
      raise Limit("diff pointer budget")
    }
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
            let child = path + format_pointer([key])
            append(Remove(child), child)
          }
        }
        for (key, value) in fresh {
          let child = path + format_pointer([key])
          match a.get(key) {
            None => append(Add(child, value), child)
            Some(previous) => walk(previous, value, child)
          }
        }
      }
      _ => append(Replace(path, b), path)
    }
  }
  walk(before, after, "")
  // Intermediate edits must fit the same budgets as the two endpoint trees.
  ignore(apply_patch(before, result, limits~))
  result
}
