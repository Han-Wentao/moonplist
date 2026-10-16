///|
test "XML scalar parser accepts declaration doctype comments and entities" {
  let doc = "<?xml version=\"1.0\"?><!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\"><plist version='1.0'><!--x--><string> a &amp; b 😀 </string></plist>"
  assert_true(decode_xml(doc) == Text(" a & b 😀 "))
  assert_true(
    decode_xml("<plist><integer>18446744073709551615</integer></plist>") ==
    Unsigned(18446744073709551615UL),
  )
  assert_true(decode_xml("<plist><true/></plist>") == Boolean(true))
}

///|
test "XML malformed grammar and entity declaration rejection" {
  for
    doc in [
      "<plist><string>x</integer></plist>", "<plist><true>x</true></plist>", "<plist version='2.0'><true/></plist>",
      "<!DOCTYPE plist [<!ENTITY x 'hello'>]><plist><string>&x;</string></plist>",
      "<plist><true/></plist><plist/>",
    ] {
    assert_true(
      try {
        ignore(decode_xml(doc))
        false
      } catch {
        _ => true
      },
    )
  }
}
