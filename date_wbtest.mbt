///|
test "UTC date epoch leap days and full year range" {
  assert_eq(parse_date("2001-01-01T00:00:00Z"), 0.0)
  assert_eq(parse_date("2000-12-31T23:59:59Z"), -1.0)
  for
    text in [
      "0001-01-01T00:00:00Z", "9999-12-31T23:59:59Z", "2000-02-29T12:34:56Z", "1900-03-01T00:00:00Z",
    ] {
    assert_eq(format_date(parse_date(text)), text)
  }
}

///|
test "date rejects invalid calendar and precision loss" {
  for
    text in [
      "1900-02-29T00:00:00Z", "2026-13-01T00:00:00Z", "2026-01-01T24:00:00Z", "2001-01-01",
    ] {
    assert_true(
      try {
        ignore(parse_date(text))
        false
      } catch {
        _ => true
      },
    )
  }
  assert_true(
    try {
      ignore(format_date(0.5))
      false
    } catch {
      _ => true
    },
  )
}
