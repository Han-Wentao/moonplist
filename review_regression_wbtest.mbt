///|
test "review XML decimal-leading-zero" {
  assert_true(
    decode_xml("<plist><string>&#00000000000000000000000065;</string></plist>") ==
    Text("A"),
  )
}

///|
test "review XML hex-leading-zero" {
  assert_true(
    decode_xml("<plist><string>&#x00000000000000000000000041;</string></plist>") ==
    Text("A"),
  )
}

///|
test "review XML astral" {
  assert_true(
    decode_xml("<plist><string>&#128526;</string></plist>") == Text("😎"),
  )
}

///|
test "review diff preserves path budget contract" {
  let limits = { ..Limits::default(), max_bytes: 8, }
  let before = Dict([])
  let after = Dict([("~~~~~~~~", Integer(1L))])
  let plan = Some(diff(before, after, limits~)) catch {
    Limit(_) => None
    _ => abort("wrong diff error")
  }
  match plan {
    Some(ops) =>
      assert_true(equivalent(apply_patch(before, ops, limits~), after))
    None => ()
  }
}

///|
test "review dictionary validate and binary budget agree" {
  let value = Dict([("a", Integer(1L))])
  let limits = { ..Limits::default(), max_objects: 3, }
  assert_true(
    equivalent(decode(encode(value, Binary, limits~), limits~), value),
  )
}

///|
test "review binary writer CoreFoundation reference width boundaries" {
  for (items, width) in [(254, 1), (255, 2), (256, 2), (65534, 2), (65535, 4)] {
    let raw = encode_binary(List(Array::make(items, Boolean(true))))
    assert_eq(inspect_binary(raw).reference_width, width)
  }
}

///|
test "review binary offset width 3" {
  assert_true(
    decode(
      decode_hex(
        "62706c6973743030a1010900000800000a000000000000030100000000000000020000000000000000000000000000000b",
      ),
    ) ==
    List([Boolean(true)]),
  )
}

///|
test "review binary reference width 3" {
  assert_true(
    decode(
      decode_hex(
        "62706c6973743030a100000109080c000000000000010300000000000000020000000000000000000000000000000d",
      ),
    ) ==
    List([Boolean(true)]),
  )
}

///|
test "review binary offset width 5" {
  assert_true(
    decode(
      decode_hex(
        "62706c6973743030a101090000000008000000000a000000000000050100000000000000020000000000000000000000000000000b",
      ),
    ) ==
    List([Boolean(true)]),
  )
}

///|
test "review binary reference width 5" {
  assert_true(
    decode(
      decode_hex(
        "62706c6973743030a1000000000109080e000000000000010500000000000000020000000000000000000000000000000f",
      ),
    ) ==
    List([Boolean(true)]),
  )
}

///|
test "review binary offset width 6" {
  assert_true(
    decode(
      decode_hex(
        "62706c6973743030a1010900000000000800000000000a000000000000060100000000000000020000000000000000000000000000000b",
      ),
    ) ==
    List([Boolean(true)]),
  )
}

///|
test "review binary reference width 6" {
  assert_true(
    decode(
      decode_hex(
        "62706c6973743030a100000000000109080f0000000000000106000000000000000200000000000000000000000000000010",
      ),
    ) ==
    List([Boolean(true)]),
  )
}

///|
test "review binary offset width 7" {
  assert_true(
    decode(
      decode_hex(
        "62706c6973743030a10109000000000000080000000000000a000000000000070100000000000000020000000000000000000000000000000b",
      ),
    ) ==
    List([Boolean(true)]),
  )
}

///|
test "review binary reference width 7" {
  assert_true(
    decode(
      decode_hex(
        "62706c6973743030a1000000000000010908100000000000000107000000000000000200000000000000000000000000000011",
      ),
    ) ==
    List([Boolean(true)]),
  )
}

///|
test "review XML references retain grammar range and byte limits" {
  assert_true(
    decode_xml(
      "<plist><string>&#000000000000000000000000000000000000128526;</string></plist>",
    ) ==
    Text("😎"),
  )
  for
    entity in [
      "&#0000000000000000000000000;", "&#x00000000000000000000d800;", "&#999999999999999999999999999999;",
      "&#x000000g;", "&aaaaaaaaaaaaaaaaaaa;", "&#00000000000065",
    ] {
    assert_true(
      try {
        ignore(decode_xml("<plist><string>" + entity + "</string></plist>"))
        false
      } catch {
        Invalid(_) => true
        _ => false
      },
    )
  }
  assert_true(
    try {
      ignore(
        decode_xml(
          "<plist><string>&#00000000000000000000000065;</string></plist>",
          limits={ ..Limits::default(), max_bytes: 32, },
        ),
      )
      false
    } catch {
      Limit(_) => true
      _ => false
    },
  )
}

///|
test "review diff escaped paths respect all operation budgets" {
  let tight = { ..Limits::default(), max_bytes: 8, }
  let wide = { ..Limits::default(), max_bytes: 17, }
  for key in ["~~~~~~~~", "////////"] {
    let empty = Dict([])
    let one = Dict([(key, Integer(1L))])
    let two = Dict([(key, Integer(2L))])
    for (before, after) in [(empty, one), (one, empty), (one, two)] {
      assert_true(
        try {
          ignore(diff(before, after, limits=tight))
          false
        } catch {
          Limit(_) => true
          _ => false
        },
      )
      assert_true(
        equivalent(
          apply_patch(before, diff(before, after, limits=wide), limits=wide),
          after,
        ),
      )
    }
    assert_eq(diff(one, one, limits=tight).length(), 0)
  }
}

///|
test "review binary widths zero and beyond uint64 remain invalid" {
  let raw = encode_binary(List([Boolean(true)]))
  for index in [raw.length() - 26, raw.length() - 25] {
    for width in [0, 9, 255] {
      let changed = raw.to_array()
      changed[index] = width.to_byte()
      assert_true(
        try {
          ignore(decode(Bytes::from_array(changed[:])))
          false
        } catch {
          Invalid(_) => true
          _ => false
        },
      )
    }
  }
}

///|
test "review diff intermediate trees obey the replay object budget" {
  let small = Integer(0L)
  let large = List(Array::make(5, Integer(1L)))
  let before = Dict([("a", small), ("b", large)])
  let after = Dict([("a", large), ("b", small)])
  let tight = { ..Limits::default(), max_objects: 10, }
  validate(before, limits=tight)
  validate(after, limits=tight)
  assert_true(
    try {
      ignore(diff(before, after, limits=tight))
      false
    } catch {
      Limit(_) => true
      _ => false
    },
  )
  let roomy = { ..tight, max_objects: 15, }
  let ops = diff(before, after, limits=roomy)
  assert_eq(ops.length(), 2)
  assert_true(equivalent(apply_patch(before, ops, limits=roomy), after))
  assert_true(before.get("a") == Some(small))
  assert_true(before.get("b") == Some(large))
}
