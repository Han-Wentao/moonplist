///|
/// Three complete downstream workflows using only the public API.
fn main {
  try {
    // Packaging: read a developer's Info.plist, patch it, emit binary artifact.
    let source = @moonplist.decode_xml(
      "<plist><dict><key>CFBundleIdentifier</key><string>org.example.app</string><key>CFBundleVersion</key><string>1</string></dict></plist>",
    )
    let updated = @moonplist.apply_patch(source, [
      @moonplist.Test("/CFBundleVersion", @moonplist.Text("1")),
      @moonplist.Replace("/CFBundleVersion", @moonplist.Text("2")),
      @moonplist.Add("/LSUIElement", @moonplist.Boolean(true)),
    ])
    let artifact = @moonplist.encode(updated, @moonplist.Binary)
    assert_true(
      @moonplist.lookup(@moonplist.decode(artifact), "/CFBundleVersion") ==
      @moonplist.Text("2"),
    )
    println("packaging: binary artifact verified")

    // Configuration interchange: data/date are preserved, not JSON-encoded strings.
    let config = @moonplist.Dict([
      ("payload", @moonplist.Data(b"\x00\xff")),
      (
        "created",
        @moonplist.Date(@moonplist.parse_date("2024-02-29T12:30:59Z")),
      ),
    ])
    let binary = @moonplist.encode(config, @moonplist.Binary)
    let xml = @moonplist.convert(binary, @moonplist.Xml)
    assert_true(@moonplist.equivalent(@moonplist.decode(xml), config))
    println("interchange: typed data and UTC date preserved")

    // Inspection/change planning: binary UID is queryable but never silently lost.
    let indexed = @moonplist.Dict([
      ("objects", @moonplist.List([@moonplist.Uid(42UL)])),
    ])
    let inspected = @moonplist.decode(
      @moonplist.encode(indexed, @moonplist.Binary),
    )
    assert_true(
      @moonplist.lookup(inspected, "/objects/0") == @moonplist.Uid(42UL),
    )
    let target = @moonplist.insert(inspected, "/name", @moonplist.Text("index"))
    let plan = @moonplist.diff(inspected, target)
    assert_true(
      @moonplist.equivalent(@moonplist.apply_patch(inspected, plan), target),
    )
    assert_true(
      try {
        ignore(@moonplist.encode(target, @moonplist.Xml))
        false
      } catch {
        _ => true
      },
    )
    println(
      "inspection: UID query, semantic diff, explicit XML rejection verified",
    )
  } catch {
    _ => abort("workflow failed")
  }
}
