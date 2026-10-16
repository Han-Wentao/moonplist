///|
test "CDATA preserves literal entities and normalizes line endings" {
  assert_true(
    decode_xml("<plist><string>a<![CDATA[<&amp;\r\nb]]>c</string></plist>") ==
    Text("a<&amp;\nbc"),
  )
}

///|
test "XML declarations and DTD cannot hide inside documents" {
  for
    bad in [
      " < ?xml version='1.0'?><plist><true/></plist>", "<plist><?xml version='1.0'?><true/></plist>",
      "<?xml version='1.1'?><plist><true/></plist>", "<?xml version='1.0' encoding='latin1'?><plist><true/></plist>",
      "<!DOCTYPE plist><!DOCTYPE plist><plist><true/></plist>", "<!DOCTYPE plist garbage><plist><true/></plist>",
      "<!DOCTYPE plist [<!ENTITY a 'b'>]><plist><string>&a;</string></plist>", "<plist><string><![CDATA[missing</string></plist>",
    ] {
    assert_true(
      try {
        ignore(decode_xml(bad))
        false
      } catch {
        _ => true
      },
    )
  }
  assert_true(
    decode_xml("<?xml version='1.0' standalone='yes'?><plist><true/></plist>") ==
    Boolean(true),
  )
}

///|
test "direct XML byte budget counts Unicode UTF8 bytes" {
  let text = "<plist><string>中文中文</string></plist>"
  assert_true(
    try {
      ignore(
        decode_xml(text, limits={
          ..Limits::default(),
          max_bytes: text.length(),
        }),
      )
      false
    } catch {
      _ => true
    },
  )
}
