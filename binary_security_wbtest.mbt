///|
test "all truncated encodings fail without unchecked indexing" {
  let bytes = encode_binary(
    Dict([("a", List([Integer(-1L), Data(b"abc"), Text("🍎")]))]),
  )
  for n = 0; n < bytes.length(); n = n + 1 {
    assert_true(
      try {
        ignore(decode_binary(Bytes::from_array(bytes[:n].to_array()[:])))
        false
      } catch {
        _ => true
      },
    )
  }
}

///|
test "single byte corruption never bypasses runtime bounds checks" {
  let bytes = encode_binary(
    Dict([("nested", List([Boolean(true), Text("中文"), Integer(-5L)]))]),
  )
  for i = 0; i < bytes.length(); i = i + 1 {
    for byte in [0, 15, 127, 255] {
      let changed = bytes.to_array()
      changed[i] = byte.to_byte()
      ignore(decode_binary(Bytes::from_array(changed[:]))) catch {
        _ => ()
      }
    }
  }
}

///|
test "expanded DAG budget rejects repeated references" {
  let raw = decode_hex(
    "62706c697374303009a20000a2010108090c000000000000010100000000000000030000000000000002000000000000000f",
  )
  assert_true(
    decode_binary(raw) ==
    List([
      List([Boolean(true), Boolean(true)]),
      List([Boolean(true), Boolean(true)]),
    ]),
  )
  assert_true(
    try {
      ignore(
        decode_binary(raw, limits={ ..Limits::default(), max_objects: 4, }),
      )
      false
    } catch {
      _ => true
    },
  )
}
