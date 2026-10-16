///|
test "transaction commits sequential array moves" {
  let original = List([Text("a"), Text("b"), Text("c")])
  let changed = apply_patch(original, [Move("/0", "/2"), Test("/2", Text("a"))])
  assert_true(changed == List([Text("b"), Text("c"), Text("a")]))
  assert_true(original == List([Text("a"), Text("b"), Text("c")]))
}

///|
test "failed batch and descendant move leave input unchanged" {
  let v = Dict([("items", List([Integer(1L)]))])
  assert_true(
    try {
      ignore(apply_patch(v, [Add("/ok", Boolean(true)), Remove("/missing")]))
      false
    } catch {
      _ => true
    },
  )
  assert_true(v.get("ok") == None)
  assert_true(
    try {
      ignore(apply_patch(v, [Move("/items", "/items/0")]))
      false
    } catch {
      _ => true
    },
  )
  let copied = apply_patch(v, [
    Copy("/items/0", "/items/-"),
    Replace("/items/0", Integer(2L)),
  ])
  assert_true(lookup(copied, "/items") == List([Integer(2L), Integer(1L)]))
}

///|
test "typed equality ignores dictionary order not integer type" {
  assert_true(
    equivalent(
      Dict([("a", Integer(1L)), ("b", Boolean(true))]),
      Dict([("b", Boolean(true)), ("a", Integer(1L))]),
    ),
  )
  assert_true(!equivalent(Integer(1L), Real(1.0)))
}
