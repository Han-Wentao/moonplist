///|
test "review XML rejects comment control" {
  let rejected = try {
    ignore(decode_xml("<!--\u{1}--><plist><true/></plist>"))
    false
  } catch {
    Invalid(_) => true
    _ => false
  }
  assert_true(rejected)
}

///|
test "review XML rejects PI control" {
  let rejected = try {
    ignore(decode_xml("<?test \u{1}?><plist><true/></plist>"))
    false
  } catch {
    Invalid(_) => true
    _ => false
  }
  assert_true(rejected)
}

///|
test "review XML rejects PI numeric target" {
  let rejected = try {
    ignore(decode_xml("<?1test?><plist><true/></plist>"))
    false
  } catch {
    Invalid(_) => true
    _ => false
  }
  assert_true(rejected)
}

///|
test "review XML rejects PI missing separator" {
  let rejected = try {
    ignore(decode_xml("<?test?bad?><plist><true/></plist>"))
    false
  } catch {
    Invalid(_) => true
    _ => false
  }
  assert_true(rejected)
}

///|
test "review XML rejects preamble entity" {
  let rejected = try {
    ignore(decode_xml("&#32;<plist><true/></plist>"))
    false
  } catch {
    Invalid(_) => true
    _ => false
  }
  assert_true(rejected)
}

///|
test "review XML rejects trailing entity" {
  let rejected = try {
    ignore(decode_xml("<plist><true/></plist>&#32;"))
    false
  } catch {
    Invalid(_) => true
    _ => false
  }
  assert_true(rejected)
}

///|
test "review XML rejects preamble CDATA" {
  let rejected = try {
    ignore(decode_xml("<![CDATA[ ]]><plist><true/></plist>"))
    false
  } catch {
    Invalid(_) => true
    _ => false
  }
  assert_true(rejected)
}

///|
test "review XML rejects trailing CDATA" {
  let rejected = try {
    ignore(decode_xml("<plist><true/></plist><![CDATA[ ]]>"))
    false
  } catch {
    Invalid(_) => true
    _ => false
  }
  assert_true(rejected)
}

///|
test "review XML rejects DOCTYPE missing separator" {
  let rejected = try {
    ignore(decode_xml("<!DOCTYPEplist><plist><true/></plist>"))
    false
  } catch {
    Invalid(_) => true
    _ => false
  }
  assert_true(rejected)
}

///|
test "review XML legal document misc and PI names remain supported" {
  let xml = "<?xml version=\"1.0\"?>\r\n<!-- valid --><?style.sheet?><?_tool:data ok?>\n<!DOCTYPE plist>\n<plist><string><![CDATA[ \r\n ]]>&#32;&amp;</string></plist>\n<?done?> <!-- end -->\r\n"
  assert_true(decode_xml(xml) == Text(" \n  &"))
}

///|
test "review XML raw whitespace and interior character references" {
  assert_true(
    decode_xml(
      " \t\n\r<plist> &#32;<array><string>&#9;&#13;&#10;</string></array> </plist> \t\r\n",
    ) ==
    List([Text("\t\r\n")]),
  )
}

///|
test "review independent array insertion removal and move model" {
  for size = 0; size < 20; size = size + 1 {
    let original = List(Array::makei(size, i => Integer(i.to_int64())))
    for at = 0; at <= size; at = at + 1 {
      let path = "/" + at.to_string()
      let added = insert(original, path, Integer(-1L))
      let expected = List(
        Array::makei(size + 1, i => {
          if i < at {
            Integer(i.to_int64())
          } else if i == at {
            Integer(-1L)
          } else {
            Integer((i - 1).to_int64())
          }
        }),
      )
      assert_true(equivalent(added, expected))
      assert_true(equivalent(remove(added, path), original))
      if size > 0 && at < size {
        let moved = apply_patch(original, [Move("/0", path)])
        let moved_expected = List(
          Array::makei(size, i => {
            if i < at {
              Integer((i + 1).to_int64())
            } else if i == at {
              Integer(0L)
            } else {
              Integer(i.to_int64())
            }
          }),
        )
        assert_true(equivalent(moved, moved_expected))
      }
      assert_true(
        equivalent(
          original,
          List(Array::makei(size, i => Integer(i.to_int64()))),
        ),
      )
    }
  }
}

///|
test "review escaped dictionary pointer edit and diff model" {
  let keys = ["", "/", "~", "a/~b", "汉🍎", "01", "-"]
  for key in keys {
    let original = Dict([(key, List([Integer(1L), Integer(2L)]))])
    let path = format_pointer([key, "1"])
    assert_true(lookup(original, path) == Integer(2L))
    let changed = replace(original, path, Text("done"))
    let expected = Dict([(key, List([Integer(1L), Text("done")]))])
    assert_true(equivalent(changed, expected))
    assert_true(
      equivalent(apply_patch(original, diff(original, expected)), expected),
    )
    assert_true(lookup(original, path) == Integer(2L))
  }
}

///|
test "review finite IEEE bit patterns survive public codecs" {
  let mut state = 601020UL
  for i = 0; i < 512; i = i + 1 {
    state = state ^ (state << 13)
    state = state ^ (state >> 7)
    state = state ^ (state << 17)
    let d = state.reinterpret_as_double()
    let value = Real(d)
    assert_true(equivalent(decode(encode(value, Binary)), value))
    if !d.is_nan() && !d.is_inf() {
      assert_true(equivalent(decode(encode(value, Xml)), value))
    }
  }
}
