///|
/// Ordered dictionaries retain input order. Duplicate keys are invalid.
pub(all) enum Value {
  Null
  Boolean(Bool)
  Integer(Int64)
  Unsigned(UInt64)
  Real(Double)
  Text(String)
  Data(Bytes)
  Date(Double)
  Uid(UInt64)
  List(Array[Value])
  Dict(Array[(String, Value)])
} derive(Eq)

///|
pub(all) suberror PlistError {
  Invalid(String)
  Limit(String)
  Unsupported(String)
  PathError(String)
}

///|
/// Budgets apply before allocation and to expanded trees, not just binary IDs.
pub(all) struct Limits {
  max_bytes : Int32
  max_objects : Int32
  max_depth : Int32
  max_items : Int32
}

///|
pub fn Limits::default() -> Limits {
  {
    max_bytes: 16777216,
    max_objects: 100000,
    max_depth: 64,
    max_items: 100000,
  }
}

///|
fn Limits::check(self : Limits) -> Unit raise PlistError {
  if self.max_bytes < 8 ||
    self.max_objects < 1 ||
    self.max_depth < 1 ||
    self.max_depth > 256 ||
    self.max_items < 1 {
    raise Limit("invalid limits; depth must be 1..256")
  }
}

///|
pub fn Value::kind(self : Value) -> String {
  match self {
    Null => "null"
    Boolean(_) => "bool"
    Integer(_) | Unsigned(_) => "integer"
    Real(_) => "real"
    Text(_) => "string"
    Data(_) => "data"
    Date(_) => "date"
    Uid(_) => "uid"
    List(_) => "array"
    Dict(_) => "dict"
  }
}

///|
pub fn Value::get(self : Value, key : String) -> Value? {
  match self {
    Dict(entries) => {
      for entry in entries {
        if entry.0 == key {
          return Some(entry.1)
        }
      }
      None
    }
    _ => None
  }
}

///|
pub fn validate(
  value : Value,
  limits~ : Limits = Limits::default(),
) -> Unit raise PlistError {
  limits.check()
  let count = Ref(0)
  fn walk(v : Value, depth : Int32) -> Unit raise PlistError {
    count.val += 1
    if count.val > limits.max_objects || depth > limits.max_depth {
      raise Limit("tree budget exceeded")
    }
    match v {
      Text(s) =>
        if s.length() > limits.max_bytes {
          raise Limit("string budget exceeded")
        }
      Data(b) =>
        if b.length() > limits.max_bytes {
          raise Limit("data budget exceeded")
        }
      Date(d) =>
        if d.is_nan() || d.is_inf() {
          raise Invalid("date must be finite")
        }
      Unsigned(n) =>
        if n <= 9223372036854775807UL {
          raise Invalid("use Integer for signed-range values")
        }
      List(items) => {
        if items.length() > limits.max_items {
          raise Limit("array budget exceeded")
        }
        for item in items {
          walk(item, depth + 1)
        }
      }
      Dict(entries) => {
        if entries.length() > limits.max_items {
          raise Limit("dictionary budget exceeded")
        }
        let keys : Map[String, Bool] = Map([])
        for (key, item) in entries {
          if key.length() > limits.max_bytes {
            raise Limit("key budget exceeded")
          }
          if keys.contains(key) {
            raise Invalid("duplicate dictionary key")
          }
          keys[key] = true
          count.val += 1
          walk(item, depth + 1)
        }
      }
      _ => ()
    }
  }
  walk(value, 0)
}

///|
pub extend Value with Eq::{equal, not_equal}
