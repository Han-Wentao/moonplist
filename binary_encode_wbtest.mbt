///|
test "binary scalar writer roundtrips all representable types" {
  let values : Array[Value] = [
    Null,
    Boolean(true),
    Integer(-9223372036854775808L),
    Integer(65536L),
    Unsigned(18446744073709551615UL),
    Text("中文😀"),
    Data(b"abc"),
    Date(-0.5),
    Uid(65536UL),
    Real(3.25),
  ]
  for v in values {
    assert_true(decode_binary(encode_binary(v)) == v)
  }
}

///|
test "binary extended string length and precision" {
  let v = Value::Text("abcdefghijklmnopqrstuvwxyz")
  assert_true(decode_binary(encode_binary(v)) == v)
  let n = Value::Real(-0.0)
  assert_true(
    decode_binary(encode_binary(n)) is Real(d) &&
    d.reinterpret_as_uint64() == 9223372036854775808UL,
  )
}
