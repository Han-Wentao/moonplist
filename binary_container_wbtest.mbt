///|
test "binary nested dictionaries arrays and shared scalar references" {
  let v = decode_binary(
    decode_hex(
      "62706c6973743030d3010203040509546e616d65556974656d73566e65737465645464656d6fa306070810010943616263d10a045473616d65080f141a21262a2c2d31340000000000000101000000000000000b00000000000000000000000000000039",
    ),
  )
  assert_true(v.get("name") is Some(Text("demo")))
  assert_true(
    v.get("items") is Some(List([Integer(1L), Boolean(true), Data(_)])),
  )
}

///|
test "cyclic object graph is rejected" {
  let bad = decode_hex(
    "62706c6973743030a10008000000000000010100000000000000010000000000000000000000000000000a",
  )
  assert_true(
    try {
      ignore(decode_binary(bad))
      false
    } catch {
      _ => true
    },
  )
}

///|
test "expanded reference and nesting budgets are enforced" {
  let b = decode_hex(
    "62706c6973743030d3010203040509546e616d65556974656d73566e65737465645464656d6fa306070810010943616263d10a045473616d65080f141a21262a2c2d31340000000000000101000000000000000b00000000000000000000000000000039",
  )
  assert_true(
    try {
      ignore(decode_binary(b, limits={ ..Limits::default(), max_depth: 1, }))
      false
    } catch {
      _ => true
    },
  )
}
