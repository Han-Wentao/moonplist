///|
test "pointer escaping empty key Unicode and numeric dictionary keys" {
  let v : Value = Dict([
    ("a/b", List([Dict([("~", Text("ok"))])])),
    ("", Text("empty")),
    ("01", Integer(1L)),
  ])
  assert_true(lookup(v, "/a~1b/0/~0") == Text("ok"))
  assert_true(lookup(v, "/") == Text("empty"))
  assert_true(lookup(v, "/01") == Integer(1L))
  for tokens in [[], ["", "a/b", "~", "😀"]] {
    assert_true(parse_pointer(format_pointer(tokens)) == tokens)
  }
}

///|
test "pointer rejects ambiguous indices escapes and missing values" {
  for ptr in ["a", "/~", "/~2", "/00", "/-", "/2", "/21474836480"] {
    assert_true(
      try {
        ignore(lookup(List([Null]), ptr))
        false
      } catch {
        _ => true
      },
    )
  }
}
