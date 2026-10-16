///|
test "functional edit preserves original and dictionary order" {
  let v : Value = Dict([
    ("a", List([Integer(1L), Integer(2L)])),
    ("b", Boolean(true)),
  ])
  let changed = replace(v, "/a/0", Integer(3L))
  assert_true(lookup(v, "/a/0") == Integer(1L))
  assert_true(lookup(changed, "/a/0") == Integer(3L))
  assert_true(lookup(insert(v, "/c", Text("new")), "/c") == Text("new"))
  assert_true(remove(v, "/b").get("b") is None)
}

///|
test "array insert replace append remove have distinct semantics" {
  let v : Value = List([Integer(1L), Integer(2L)])
  assert_true(insert(v, "/0", Null) == List([Null, Integer(1L), Integer(2L)]))
  assert_true(insert(v, "/-", Null) == List([Integer(1L), Integer(2L), Null]))
  assert_true(remove(v, "/0") == List([Integer(2L)]))
  assert_true(replace(v, "", Null) == Null)
  assert_true(
    try {
      ignore(remove(v, ""))
      false
    } catch {
      _ => true
    },
  )
  assert_true(
    try {
      ignore(replace(v, "/-", Null))
      false
    } catch {
      _ => true
    },
  )
}
