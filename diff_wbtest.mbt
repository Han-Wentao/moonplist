///|
test "diff replays escaped keys arrays types and root changes" {
  let a = Dict([
    ("removed", Null),
    ("a/b", Dict([("~", Integer(1L))])),
    ("list", List([])),
  ])
  let b = Dict([
    ("a/b", Dict([("~", Real(1.0))])),
    ("list", List([Boolean(true)])),
    ("added", Data(b"abc")),
  ])
  let ops = diff(a, b)
  assert_eq(ops.length(), 4)
  assert_true(equivalent(apply_patch(a, ops), b))
  assert_true(equivalent(apply_patch(a, diff(a, Integer(5L))), Integer(5L)))
  assert_eq(diff(b, b).length(), 0)
}

///|
test "diff operation limit is explicit" {
  let limits = { ..Limits::default(), max_items: 1, }
  assert_true(
    try {
      ignore(
        diff(
          Dict([("nested", Dict([("a", Null)]))]),
          Dict([("new", Null)]),
          limits~,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}
