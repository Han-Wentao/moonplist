///|
test "auto decode UTF8 UTF16 endian variants and conversion" {
  assert_true(
    decode(
      decode_hex(
        "efbbbf3c706c6973743e3c737472696e673ee4b8ade69687f09f98803c2f737472696e673e3c2f706c6973743e",
      ),
    ) ==
    Text("中文😀"),
  )
  assert_true(
    decode(
      decode_hex(
        "fffe3c0070006c006900730074003e003c0073007400720069006e0067003e002d4e87653dd800de3c002f0073007400720069006e0067003e003c002f0070006c006900730074003e00",
      ),
    ) ==
    Text("中文😀"),
  )
  assert_true(
    decode(
      decode_hex(
        "003c0070006c006900730074003e003c0073007400720069006e0067003e4e2d6587d83dde00003c002f0073007400720069006e0067003e003c002f0070006c006900730074003e",
      ),
    ) ==
    Text("中文😀"),
  )
  let b = encode(Dict([("app", Text("demo"))]), Binary)
  assert_true(decode(convert(b, Xml)) == decode(b))
}

///|
test "invalid byte encoding and unknown format fail closed" {
  for b in [b"\xff", b"bplist01", b"{ foo = bar; }"] {
    assert_true(
      try {
        ignore(decode(b))
        false
      } catch {
        _ => true
      },
    )
  }
}
