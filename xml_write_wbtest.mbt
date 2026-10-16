///|
test "XML writer preserves supported types and whitespace in both layouts" {
  let v : Value = Dict([
    (" name ", Text(" <>&中文😀\r ")),
    ("data", Data(b"\x00\xff")),
    (
      "values",
      List([
        Integer(-1L),
        Unsigned(18446744073709551615UL),
        Real(1.5),
        Date(-1.0),
        Boolean(true),
      ]),
    ),
  ])
  for pretty in [true, false] {
    assert_true(decode_xml(encode_xml(v, pretty~)) == v)
  }
}

///|
test "XML writer rejects binary-only objects invalid characters and date loss" {
  for v in [Value::Null, Uid(1UL), Date(0.5), Text("\u{00}")] {
    assert_true(
      try {
        ignore(encode_xml(v))
        false
      } catch {
        _ => true
      },
    )
  }
  assert_true(
    try {
      ignore(
        encode_xml(Text("😀"), limits={ ..Limits::default(), max_bytes: 50, }),
      )
      false
    } catch {
      _ => true
    },
  )
}

///|
test "nonfinite reals are explicit not confused with dates" {
  for
    d in [
      9221120237041090560UL.reinterpret_as_double(),
      9218868437227405312UL.reinterpret_as_double(),
      18442240474082181120UL.reinterpret_as_double(),
    ] {
    let v = decode_xml(encode_xml(Real(d)))
    assert_true(v is Real(x) && (x.is_nan() || x.is_inf()))
  }
}

///|
test "XML writer retains IEEE negative zero" {
  let v = Real(0x8000000000000000UL.reinterpret_as_double())
  let decoded = decode_xml(encode_xml(v))
  match decoded {
    Real(d) => assert_eq(d.reinterpret_as_uint64(), 0x8000000000000000UL)
    _ => abort("real expected")
  }
}
