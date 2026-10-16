///|
test "binary trailer from Python plistlib" {
  let b = decode_hex(
    "62706c697374303009080000000000000101000000000000000100000000000000000000000000000009",
  )
  let info = inspect_binary(b)
  assert_eq(info.object_count, 1)
  assert_eq(info.root_id, 0)
  assert_eq(info.offset_table, 9)
}

///|
test "binary header truncation and corrupt widths" {
  for raw in [b"", b"bplist00", b"notaplist"] {
    assert_true(
      try {
        ignore(inspect_binary(raw))
        false
      } catch {
        _ => true
      },
    )
  }
}
