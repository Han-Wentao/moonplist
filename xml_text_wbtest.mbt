///|
test "XML predefined numeric entities and newline normalization" {
  assert_eq(
    unescape_xml_text("&amp;&lt;&gt;&quot;&apos;&#x1f600;&#13;"),
    "&<>\"'😀\r",
  )
  assert_eq(unescape_xml_text("a\r\nb\rc"), "a\nb\nc")
  let text = "a<&>\r中文😀"
  assert_eq(unescape_xml_text(escape_xml_text(text)), text)
}

///|
test "XML entities reject invalid Unicode and expansion" {
  for
    s in ["&external;", "&#0;", "&#xD800;", "&#x110000;", "&#;", "&amp", "]]>"] {
    assert_true(
      try {
        ignore(unescape_xml_text(s))
        false
      } catch {
        _ => true
      },
    )
  }
}
