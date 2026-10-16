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

///|
test "binary writer nested containers and wide reference tables" {
  let items : Array[Value] = []
  for i = 0; i < 300; i = i + 1 {
    items.push(Dict([("index", Integer(i.to_int64()))]))
  }
  let v = Value::List(items)
  let b = encode_binary(v)
  assert_true(inspect_binary(b).reference_width > 1)
  assert_true(decode_binary(b) == v)
  assert_true(encode_binary(v) == b)
}

///|
test "binary writer enforces aggregate output budget" {
  let limits = { ..Limits::default(), max_bytes: 64, }
  assert_true(
    try {
      ignore(
        encode_binary(
          List([
            Text("abcdefghijklmnopqrstuvwxyz"),
            Text("abcdefghijklmnopqrstuvwxyz"),
          ]),
          limits~,
        ),
      )
      false
    } catch {
      _ => true
    },
  )
}
