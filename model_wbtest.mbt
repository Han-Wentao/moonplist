///|
test "typed dictionary lookup and duplicate rejection" {
  let v : Value = Dict([("name", Text("app")), ("enabled", Boolean(true))])
  validate(v)
  assert_eq(v.kind(), "dict")
  assert_true(v.get("name") is Some(Text("app")))
  assert_true(v.get("absent") is None)
  let bad = try {
    validate(Dict([("a", Null), ("a", Null)]))
    false
  } catch {
    _ => true
  }
  assert_true(bad)
}

///|
test "tree budgets and canonical unsigned representation" {
  let bad = try {
    validate(Unsigned(1UL))
    false
  } catch {
    _ => true
  }
  assert_true(bad)
  let limited = try {
    validate(List([Null]), limits={ ..Limits::default(), max_objects: 1, })
    false
  } catch {
    _ => true
  }
  assert_true(limited)
}
