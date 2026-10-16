///|
test "base64 padding and whitespace" {
  for
    (raw, encoded) in [
      (b"", ""),
      (b"f", "Zg=="),
      (b"fo", "Zm8="),
      (b"foo", "Zm9v"),
    ] {
    assert_eq(encode_base64(raw), encoded)
    assert_true(decode_base64(encoded) == raw)
  }
  assert_true(decode_base64(" Zm9v\n") == b"foo")
  for bad in ["A", "====", "Zh==", "Zm9=", "Zg==AAAA", "!!!!"] {
    let rejected = try {
      ignore(decode_base64(bad))
      false
    } catch {
      _ => true
    }
    assert_true(rejected)
  }
}

///|
test "hex byte roundtrip" {
  assert_true(decode_hex("00aAFF") == b"\x00\xaa\xff")
  assert_eq(encode_hex(b"\x00\xaa\xff"), "00aaff")
}
