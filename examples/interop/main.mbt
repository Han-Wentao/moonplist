///|
fn main {
  try {
    {
      let expected = @moonplist.Integer(-9223372036854775808L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030138000000000000000080000000000000101000000000000000100000000000000000000000000000011",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Integer(-9223372036854775808L),
          decoded,
        ),
      )
      println(
        "CASE:0:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Integer(-9223372036854775808L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c696e74656765723e2d393232333337323033363835343737353830383c2f696e74656765723e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Integer(-9223372036854775808L),
          decoded,
        ),
      )
      println(
        "CASE:1:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Integer(-1L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303013ffffffffffffffff080000000000000101000000000000000100000000000000000000000000000011",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Integer(-1L), decoded))
      println(
        "CASE:2:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Integer(-1L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c696e74656765723e2d313c2f696e74656765723e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Integer(-1L), decoded))
      println(
        "CASE:3:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Integer(0L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030100008000000000000010100000000000000010000000000000000000000000000000a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Integer(0L), decoded))
      println(
        "CASE:4:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Integer(0L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c696e74656765723e303c2f696e74656765723e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Integer(0L), decoded))
      println(
        "CASE:5:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Integer(255L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303010ff08000000000000010100000000000000010000000000000000000000000000000a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Integer(255L), decoded))
      println(
        "CASE:6:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Integer(255L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c696e74656765723e3235353c2f696e74656765723e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Integer(255L), decoded))
      println(
        "CASE:7:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Integer(256L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303011010008000000000000010100000000000000010000000000000000000000000000000b",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Integer(256L), decoded))
      println(
        "CASE:8:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Integer(256L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c696e74656765723e3235363c2f696e74656765723e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Integer(256L), decoded))
      println(
        "CASE:9:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Integer(2147483648L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030128000000008000000000000010100000000000000010000000000000000000000000000000d",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Integer(2147483648L), decoded),
      )
      println(
        "CASE:10:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Integer(2147483648L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c696e74656765723e323134373438333634383c2f696e74656765723e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Integer(2147483648L), decoded),
      )
      println(
        "CASE:11:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Integer(9223372036854775807L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030137fffffffffffffff080000000000000101000000000000000100000000000000000000000000000011",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Integer(9223372036854775807L), decoded),
      )
      println(
        "CASE:12:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Integer(9223372036854775807L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c696e74656765723e393232333337323033363835343737353830373c2f696e74656765723e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Integer(9223372036854775807L), decoded),
      )
      println(
        "CASE:13:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Unsigned(9223372036854775808UL)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c69737430301400000000000000008000000000000000080000000000000101000000000000000100000000000000000000000000000019",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Unsigned(9223372036854775808UL),
          decoded,
        ),
      )
      println(
        "CASE:14:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Unsigned(9223372036854775808UL)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c696e74656765723e393232333337323033363835343737353830383c2f696e74656765723e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Unsigned(9223372036854775808UL),
          decoded,
        ),
      )
      println(
        "CASE:15:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Unsigned(18446744073709551615UL)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030140000000000000000ffffffffffffffff080000000000000101000000000000000100000000000000000000000000000019",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Unsigned(18446744073709551615UL),
          decoded,
        ),
      )
      println(
        "CASE:16:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Unsigned(18446744073709551615UL)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c696e74656765723e31383434363734343037333730393535313631353c2f696e74656765723e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Unsigned(18446744073709551615UL),
          decoded,
        ),
      )
      println(
        "CASE:17:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Real(0.0)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030230000000000000000080000000000000101000000000000000100000000000000000000000000000011",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Real(0.0), decoded))
      println(
        "CASE:18:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Real(0.0)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c7265616c3e302e303c2f7265616c3e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Real(0.0), decoded))
      println(
        "CASE:19:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Real(-0.0)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030238000000000000000080000000000000101000000000000000100000000000000000000000000000011",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Real(-0.0), decoded))
      println(
        "CASE:20:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Real(-0.0)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c7265616c3e2d302e303c2f7265616c3e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Real(-0.0), decoded))
      println(
        "CASE:21:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Real(1.25)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030233ff4000000000000080000000000000101000000000000000100000000000000000000000000000011",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Real(1.25), decoded))
      println(
        "CASE:22:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Real(1.25)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c7265616c3e312e32353c2f7265616c3e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Real(1.25), decoded))
      println(
        "CASE:23:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Boolean(true)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303009080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(true), decoded))
      println(
        "CASE:24:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Boolean(true)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c747275652f3e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(true), decoded))
      println(
        "CASE:25:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Boolean(false)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303008080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(false), decoded))
      println(
        "CASE:26:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Boolean(false)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c66616c73652f3e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(false), decoded))
      println(
        "CASE:27:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Text("")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303050080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Text(""), decoded))
      println(
        "CASE:28:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Text("")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c737472696e673e3c2f737472696e673e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Text(""), decoded))
      println(
        "CASE:29:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Text("汉🍎<&>\r\n")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030686c49d83cdf4e003c0026003e000d000a080000000000000101000000000000000100000000000000000000000000000019",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Text("汉🍎<&>\r\n"), decoded),
      )
      println(
        "CASE:30:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Text("汉🍎<&>\r\n")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c737472696e673ee6b189f09f8d8e266c743b26616d703b2667743b0a3c2f737472696e673e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Text("汉🍎<&>\n"), decoded),
      )
      println(
        "CASE:31:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Data(
        @moonplist.decode_hex(
          "000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f404142434445464748494a4b4c4d4e4f505152535455565758595a5b5c5d5e5f606162636465666768696a6b6c6d6e6f707172737475767778797a7b7c7d7e7f808182838485868788898a8b8c8d8e8f909192939495969798999a9b9c9d9e9fa0a1a2a3a4a5a6a7a8a9aaabacadaeafb0b1b2b3b4b5b6b7b8b9babbbcbdbebfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfd0d1d2d3d4d5d6d7d8d9dadbdcdddedfe0e1e2e3e4e5e6e7e8e9eaebecedeeeff0f1f2f3f4f5f6f7f8f9fafbfcfdfeff",
        ),
      )
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c69737430304f110100000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f404142434445464748494a4b4c4d4e4f505152535455565758595a5b5c5d5e5f606162636465666768696a6b6c6d6e6f707172737475767778797a7b7c7d7e7f808182838485868788898a8b8c8d8e8f909192939495969798999a9b9c9d9e9fa0a1a2a3a4a5a6a7a8a9aaabacadaeafb0b1b2b3b4b5b6b7b8b9babbbcbdbebfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfd0d1d2d3d4d5d6d7d8d9dadbdcdddedfe0e1e2e3e4e5e6e7e8e9eaebecedeeeff0f1f2f3f4f5f6f7f8f9fafbfcfdfeff0008000000000000020100000000000000010000000000000000000000000000010c",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(
            @moonplist.decode_hex(
              "000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f404142434445464748494a4b4c4d4e4f505152535455565758595a5b5c5d5e5f606162636465666768696a6b6c6d6e6f707172737475767778797a7b7c7d7e7f808182838485868788898a8b8c8d8e8f909192939495969798999a9b9c9d9e9fa0a1a2a3a4a5a6a7a8a9aaabacadaeafb0b1b2b3b4b5b6b7b8b9babbbcbdbebfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfd0d1d2d3d4d5d6d7d8d9dadbdcdddedfe0e1e2e3e4e5e6e7e8e9eaebecedeeeff0f1f2f3f4f5f6f7f8f9fafbfcfdfeff",
            ),
          ),
          decoded,
        ),
      )
      println(
        "CASE:32:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Data(
        @moonplist.decode_hex(
          "000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f404142434445464748494a4b4c4d4e4f505152535455565758595a5b5c5d5e5f606162636465666768696a6b6c6d6e6f707172737475767778797a7b7c7d7e7f808182838485868788898a8b8c8d8e8f909192939495969798999a9b9c9d9e9fa0a1a2a3a4a5a6a7a8a9aaabacadaeafb0b1b2b3b4b5b6b7b8b9babbbcbdbebfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfd0d1d2d3d4d5d6d7d8d9dadbdcdddedfe0e1e2e3e4e5e6e7e8e9eaebecedeeeff0f1f2f3f4f5f6f7f8f9fafbfcfdfeff",
        ),
      )
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646174613e0a41414543417751464267634943516f4c4441304f4478415245684d554652595847426b6147787764486838674953496a4a43556d4a7967704b6973734c5334764d4445794d7a51314e6a63340a4f546f375044302b50304242516b4e4552555a4853456c4b5330784e546b395155564a54564656575631685a576c746358563566594746695932526c5a6d646f6157707262473175623342780a636e4e3064585a3365486c3665337839666e2b4167594b44684957476834694a696f754d6a5936506b4a47536b3553566c7065596d5a71626e4a32656e3643686f714f6b7061616e714b6d710a7136797472712b7773624b7a744c573274376935757275387662362f774d484377385446787366497963724c7a4d334f7a3944523074505531646258324e6e6132397a6433742f6734654c6a0a354f586d352b6a70367576733765377638504879382f5431397666342b6672372f50332b2f773d3d0a3c2f646174613e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(
            @moonplist.decode_hex(
              "000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f404142434445464748494a4b4c4d4e4f505152535455565758595a5b5c5d5e5f606162636465666768696a6b6c6d6e6f707172737475767778797a7b7c7d7e7f808182838485868788898a8b8c8d8e8f909192939495969798999a9b9c9d9e9fa0a1a2a3a4a5a6a7a8a9aaabacadaeafb0b1b2b3b4b5b6b7b8b9babbbcbdbebfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfd0d1d2d3d4d5d6d7d8d9dadbdcdddedfe0e1e2e3e4e5e6e7e8e9eaebecedeeeff0f1f2f3f4f5f6f7f8f9fafbfcfdfeff",
            ),
          ),
          decoded,
        ),
      )
      println(
        "CASE:33:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Date(0.0)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030330000000000000000080000000000000101000000000000000100000000000000000000000000000011",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Date(0.0), decoded))
      println(
        "CASE:34:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Date(0.0)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646174653e323030312d30312d30315430303a30303a30305a3c2f646174653e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Date(0.0), decoded))
      println(
        "CASE:35:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Date(-3187296000.0)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303033c1e7bf48e0000000080000000000000101000000000000000100000000000000000000000000000011",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Date(-3187296000.0), decoded),
      )
      println(
        "CASE:36:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Date(-3187296000.0)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646174653e313930302d30312d30315430303a30303a30305a3c2f646174653e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Date(-3187296000.0), decoded),
      )
      println(
        "CASE:37:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.List([])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030a0080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.List([]), decoded))
      println(
        "CASE:38:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.List([])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c61727261792f3e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.List([]), decoded))
      println(
        "CASE:39:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Dict([])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030d0080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Dict([]), decoded))
      println(
        "CASE:40:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Dict([])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646963742f3e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Dict([]), decoded))
      println(
        "CASE:41:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.List([
        @moonplist.Integer(0L),
        @moonplist.Integer(1L),
        @moonplist.Integer(2L),
        @moonplist.Integer(3L),
        @moonplist.Integer(4L),
        @moonplist.Integer(5L),
        @moonplist.Integer(6L),
        @moonplist.Integer(7L),
        @moonplist.Integer(8L),
        @moonplist.Integer(9L),
        @moonplist.Integer(10L),
        @moonplist.Integer(11L),
        @moonplist.Integer(12L),
        @moonplist.Integer(13L),
        @moonplist.Integer(14L),
        @moonplist.Integer(15L),
        @moonplist.Integer(16L),
        @moonplist.Integer(17L),
        @moonplist.Integer(18L),
        @moonplist.Integer(19L),
        @moonplist.Integer(20L),
        @moonplist.Integer(21L),
        @moonplist.Integer(22L),
        @moonplist.Integer(23L),
        @moonplist.Integer(24L),
        @moonplist.Integer(25L),
        @moonplist.Integer(26L),
        @moonplist.Integer(27L),
        @moonplist.Integer(28L),
        @moonplist.Integer(29L),
        @moonplist.Integer(30L),
        @moonplist.Integer(31L),
        @moonplist.Integer(32L),
        @moonplist.Integer(33L),
        @moonplist.Integer(34L),
        @moonplist.Integer(35L),
        @moonplist.Integer(36L),
        @moonplist.Integer(37L),
        @moonplist.Integer(38L),
        @moonplist.Integer(39L),
        @moonplist.Integer(40L),
        @moonplist.Integer(41L),
        @moonplist.Integer(42L),
        @moonplist.Integer(43L),
        @moonplist.Integer(44L),
        @moonplist.Integer(45L),
        @moonplist.Integer(46L),
        @moonplist.Integer(47L),
        @moonplist.Integer(48L),
        @moonplist.Integer(49L),
        @moonplist.Integer(50L),
        @moonplist.Integer(51L),
        @moonplist.Integer(52L),
        @moonplist.Integer(53L),
        @moonplist.Integer(54L),
        @moonplist.Integer(55L),
        @moonplist.Integer(56L),
        @moonplist.Integer(57L),
        @moonplist.Integer(58L),
        @moonplist.Integer(59L),
        @moonplist.Integer(60L),
        @moonplist.Integer(61L),
        @moonplist.Integer(62L),
        @moonplist.Integer(63L),
        @moonplist.Integer(64L),
        @moonplist.Integer(65L),
        @moonplist.Integer(66L),
        @moonplist.Integer(67L),
        @moonplist.Integer(68L),
        @moonplist.Integer(69L),
        @moonplist.Integer(70L),
        @moonplist.Integer(71L),
        @moonplist.Integer(72L),
        @moonplist.Integer(73L),
        @moonplist.Integer(74L),
        @moonplist.Integer(75L),
        @moonplist.Integer(76L),
        @moonplist.Integer(77L),
        @moonplist.Integer(78L),
        @moonplist.Integer(79L),
        @moonplist.Integer(80L),
        @moonplist.Integer(81L),
        @moonplist.Integer(82L),
        @moonplist.Integer(83L),
        @moonplist.Integer(84L),
        @moonplist.Integer(85L),
        @moonplist.Integer(86L),
        @moonplist.Integer(87L),
        @moonplist.Integer(88L),
        @moonplist.Integer(89L),
        @moonplist.Integer(90L),
        @moonplist.Integer(91L),
        @moonplist.Integer(92L),
        @moonplist.Integer(93L),
        @moonplist.Integer(94L),
        @moonplist.Integer(95L),
        @moonplist.Integer(96L),
        @moonplist.Integer(97L),
        @moonplist.Integer(98L),
        @moonplist.Integer(99L),
        @moonplist.Integer(100L),
        @moonplist.Integer(101L),
        @moonplist.Integer(102L),
        @moonplist.Integer(103L),
        @moonplist.Integer(104L),
        @moonplist.Integer(105L),
        @moonplist.Integer(106L),
        @moonplist.Integer(107L),
        @moonplist.Integer(108L),
        @moonplist.Integer(109L),
        @moonplist.Integer(110L),
        @moonplist.Integer(111L),
        @moonplist.Integer(112L),
        @moonplist.Integer(113L),
        @moonplist.Integer(114L),
        @moonplist.Integer(115L),
        @moonplist.Integer(116L),
        @moonplist.Integer(117L),
        @moonplist.Integer(118L),
        @moonplist.Integer(119L),
        @moonplist.Integer(120L),
        @moonplist.Integer(121L),
        @moonplist.Integer(122L),
        @moonplist.Integer(123L),
        @moonplist.Integer(124L),
        @moonplist.Integer(125L),
        @moonplist.Integer(126L),
        @moonplist.Integer(127L),
        @moonplist.Integer(128L),
        @moonplist.Integer(129L),
        @moonplist.Integer(130L),
        @moonplist.Integer(131L),
        @moonplist.Integer(132L),
        @moonplist.Integer(133L),
        @moonplist.Integer(134L),
        @moonplist.Integer(135L),
        @moonplist.Integer(136L),
        @moonplist.Integer(137L),
        @moonplist.Integer(138L),
        @moonplist.Integer(139L),
        @moonplist.Integer(140L),
        @moonplist.Integer(141L),
        @moonplist.Integer(142L),
        @moonplist.Integer(143L),
        @moonplist.Integer(144L),
        @moonplist.Integer(145L),
        @moonplist.Integer(146L),
        @moonplist.Integer(147L),
        @moonplist.Integer(148L),
        @moonplist.Integer(149L),
        @moonplist.Integer(150L),
        @moonplist.Integer(151L),
        @moonplist.Integer(152L),
        @moonplist.Integer(153L),
        @moonplist.Integer(154L),
        @moonplist.Integer(155L),
        @moonplist.Integer(156L),
        @moonplist.Integer(157L),
        @moonplist.Integer(158L),
        @moonplist.Integer(159L),
        @moonplist.Integer(160L),
        @moonplist.Integer(161L),
        @moonplist.Integer(162L),
        @moonplist.Integer(163L),
        @moonplist.Integer(164L),
        @moonplist.Integer(165L),
        @moonplist.Integer(166L),
        @moonplist.Integer(167L),
        @moonplist.Integer(168L),
        @moonplist.Integer(169L),
        @moonplist.Integer(170L),
        @moonplist.Integer(171L),
        @moonplist.Integer(172L),
        @moonplist.Integer(173L),
        @moonplist.Integer(174L),
        @moonplist.Integer(175L),
        @moonplist.Integer(176L),
        @moonplist.Integer(177L),
        @moonplist.Integer(178L),
        @moonplist.Integer(179L),
        @moonplist.Integer(180L),
        @moonplist.Integer(181L),
        @moonplist.Integer(182L),
        @moonplist.Integer(183L),
        @moonplist.Integer(184L),
        @moonplist.Integer(185L),
        @moonplist.Integer(186L),
        @moonplist.Integer(187L),
        @moonplist.Integer(188L),
        @moonplist.Integer(189L),
        @moonplist.Integer(190L),
        @moonplist.Integer(191L),
        @moonplist.Integer(192L),
        @moonplist.Integer(193L),
        @moonplist.Integer(194L),
        @moonplist.Integer(195L),
        @moonplist.Integer(196L),
        @moonplist.Integer(197L),
        @moonplist.Integer(198L),
        @moonplist.Integer(199L),
        @moonplist.Integer(200L),
        @moonplist.Integer(201L),
        @moonplist.Integer(202L),
        @moonplist.Integer(203L),
        @moonplist.Integer(204L),
        @moonplist.Integer(205L),
        @moonplist.Integer(206L),
        @moonplist.Integer(207L),
        @moonplist.Integer(208L),
        @moonplist.Integer(209L),
        @moonplist.Integer(210L),
        @moonplist.Integer(211L),
        @moonplist.Integer(212L),
        @moonplist.Integer(213L),
        @moonplist.Integer(214L),
        @moonplist.Integer(215L),
        @moonplist.Integer(216L),
        @moonplist.Integer(217L),
        @moonplist.Integer(218L),
        @moonplist.Integer(219L),
        @moonplist.Integer(220L),
        @moonplist.Integer(221L),
        @moonplist.Integer(222L),
        @moonplist.Integer(223L),
        @moonplist.Integer(224L),
        @moonplist.Integer(225L),
        @moonplist.Integer(226L),
        @moonplist.Integer(227L),
        @moonplist.Integer(228L),
        @moonplist.Integer(229L),
        @moonplist.Integer(230L),
        @moonplist.Integer(231L),
        @moonplist.Integer(232L),
        @moonplist.Integer(233L),
        @moonplist.Integer(234L),
        @moonplist.Integer(235L),
        @moonplist.Integer(236L),
        @moonplist.Integer(237L),
        @moonplist.Integer(238L),
        @moonplist.Integer(239L),
        @moonplist.Integer(240L),
        @moonplist.Integer(241L),
        @moonplist.Integer(242L),
        @moonplist.Integer(243L),
        @moonplist.Integer(244L),
        @moonplist.Integer(245L),
        @moonplist.Integer(246L),
        @moonplist.Integer(247L),
        @moonplist.Integer(248L),
        @moonplist.Integer(249L),
        @moonplist.Integer(250L),
        @moonplist.Integer(251L),
        @moonplist.Integer(252L),
        @moonplist.Integer(253L),
        @moonplist.Integer(254L),
        @moonplist.Integer(255L),
        @moonplist.Integer(256L),
        @moonplist.Integer(257L),
        @moonplist.Integer(258L),
        @moonplist.Integer(259L),
        @moonplist.Integer(260L),
        @moonplist.Integer(261L),
        @moonplist.Integer(262L),
        @moonplist.Integer(263L),
        @moonplist.Integer(264L),
        @moonplist.Integer(265L),
        @moonplist.Integer(266L),
        @moonplist.Integer(267L),
        @moonplist.Integer(268L),
        @moonplist.Integer(269L),
        @moonplist.Integer(270L),
        @moonplist.Integer(271L),
        @moonplist.Integer(272L),
        @moonplist.Integer(273L),
        @moonplist.Integer(274L),
        @moonplist.Integer(275L),
        @moonplist.Integer(276L),
        @moonplist.Integer(277L),
        @moonplist.Integer(278L),
        @moonplist.Integer(279L),
        @moonplist.Integer(280L),
        @moonplist.Integer(281L),
        @moonplist.Integer(282L),
        @moonplist.Integer(283L),
        @moonplist.Integer(284L),
        @moonplist.Integer(285L),
        @moonplist.Integer(286L),
        @moonplist.Integer(287L),
        @moonplist.Integer(288L),
        @moonplist.Integer(289L),
        @moonplist.Integer(290L),
        @moonplist.Integer(291L),
        @moonplist.Integer(292L),
        @moonplist.Integer(293L),
        @moonplist.Integer(294L),
        @moonplist.Integer(295L),
        @moonplist.Integer(296L),
        @moonplist.Integer(297L),
        @moonplist.Integer(298L),
        @moonplist.Integer(299L),
      ])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030af11012c000100020003000400050006000700080009000a000b000c000d000e000f0010001100120013001400150016001700180019001a001b001c001d001e001f0020002100220023002400250026002700280029002a002b002c002d002e002f0030003100320033003400350036003700380039003a003b003c003d003e003f0040004100420043004400450046004700480049004a004b004c004d004e004f0050005100520053005400550056005700580059005a005b005c005d005e005f0060006100620063006400650066006700680069006a006b006c006d006e006f0070007100720073007400750076007700780079007a007b007c007d007e007f0080008100820083008400850086008700880089008a008b008c008d008e008f0090009100920093009400950096009700980099009a009b009c009d009e009f00a000a100a200a300a400a500a600a700a800a900aa00ab00ac00ad00ae00af00b000b100b200b300b400b500b600b700b800b900ba00bb00bc00bd00be00bf00c000c100c200c300c400c500c600c700c800c900ca00cb00cc00cd00ce00cf00d000d100d200d300d400d500d600d700d800d900da00db00dc00dd00de00df00e000e100e200e300e400e500e600e700e800e900ea00eb00ec00ed00ee00ef00f000f100f200f300f400f500f600f700f800f900fa00fb00fc00fd00fe00ff0100010101020103010401050106010701080109010a010b010c010d010e010f0110011101120113011401150116011701180119011a011b011c011d011e011f0120012101220123012401250126012701280129012a012b012c1000100110021003100410051006100710081009100a100b100c100d100e100f1010101110121013101410151016101710181019101a101b101c101d101e101f1020102110221023102410251026102710281029102a102b102c102d102e102f1030103110321033103410351036103710381039103a103b103c103d103e103f1040104110421043104410451046104710481049104a104b104c104d104e104f1050105110521053105410551056105710581059105a105b105c105d105e105f1060106110621063106410651066106710681069106a106b106c106d106e106f1070107110721073107410751076107710781079107a107b107c107d107e107f1080108110821083108410851086108710881089108a108b108c108d108e108f1090109110921093109410951096109710981099109a109b109c109d109e109f10a010a110a210a310a410a510a610a710a810a910aa10ab10ac10ad10ae10af10b010b110b210b310b410b510b610b710b810b910ba10bb10bc10bd10be10bf10c010c110c210c310c410c510c610c710c810c910ca10cb10cc10cd10ce10cf10d010d110d210d310d410d510d610d710d810d910da10db10dc10dd10de10df10e010e110e210e310e410e510e610e710e810e910ea10eb10ec10ed10ee10ef10f010f110f210f310f410f510f610f710f810f910fa10fb10fc10fd10fe10ff11010011010111010211010311010411010511010611010711010811010911010a11010b11010c11010d11010e11010f11011011011111011211011311011411011511011611011711011811011911011a11011b11011c11011d11011e11011f11012011012111012211012311012411012511012611012711012811012911012a11012b0008026402660268026a026c026e02700272027402760278027a027c027e02800282028402860288028a028c028e02900292029402960298029a029c029e02a002a202a402a602a802aa02ac02ae02b002b202b402b602b802ba02bc02be02c002c202c402c602c802ca02cc02ce02d002d202d402d602d802da02dc02de02e002e202e402e602e802ea02ec02ee02f002f202f402f602f802fa02fc02fe03000302030403060308030a030c030e03100312031403160318031a031c031e03200322032403260328032a032c032e03300332033403360338033a033c033e03400342034403460348034a034c034e03500352035403560358035a035c035e03600362036403660368036a036c036e03700372037403760378037a037c037e03800382038403860388038a038c038e03900392039403960398039a039c039e03a003a203a403a603a803aa03ac03ae03b003b203b403b603b803ba03bc03be03c003c203c403c603c803ca03cc03ce03d003d203d403d603d803da03dc03de03e003e203e403e603e803ea03ec03ee03f003f203f403f603f803fa03fc03fe04000402040404060408040a040c040e04100412041404160418041a041c041e04200422042404260428042a042c042e04300432043404360438043a043c043e04400442044404460448044a044c044e04500452045404560458045a045c045e0460046204640467046a046d0470047304760479047c047f048204850488048b048e049104940497049a049d04a004a304a604a904ac04af04b204b504b804bb04be04c104c404c704ca04cd04d004d304d604d904dc04df04e204e50000000000000202000000000000012d000000000000000000000000000004e8",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.List([
            @moonplist.Integer(0L),
            @moonplist.Integer(1L),
            @moonplist.Integer(2L),
            @moonplist.Integer(3L),
            @moonplist.Integer(4L),
            @moonplist.Integer(5L),
            @moonplist.Integer(6L),
            @moonplist.Integer(7L),
            @moonplist.Integer(8L),
            @moonplist.Integer(9L),
            @moonplist.Integer(10L),
            @moonplist.Integer(11L),
            @moonplist.Integer(12L),
            @moonplist.Integer(13L),
            @moonplist.Integer(14L),
            @moonplist.Integer(15L),
            @moonplist.Integer(16L),
            @moonplist.Integer(17L),
            @moonplist.Integer(18L),
            @moonplist.Integer(19L),
            @moonplist.Integer(20L),
            @moonplist.Integer(21L),
            @moonplist.Integer(22L),
            @moonplist.Integer(23L),
            @moonplist.Integer(24L),
            @moonplist.Integer(25L),
            @moonplist.Integer(26L),
            @moonplist.Integer(27L),
            @moonplist.Integer(28L),
            @moonplist.Integer(29L),
            @moonplist.Integer(30L),
            @moonplist.Integer(31L),
            @moonplist.Integer(32L),
            @moonplist.Integer(33L),
            @moonplist.Integer(34L),
            @moonplist.Integer(35L),
            @moonplist.Integer(36L),
            @moonplist.Integer(37L),
            @moonplist.Integer(38L),
            @moonplist.Integer(39L),
            @moonplist.Integer(40L),
            @moonplist.Integer(41L),
            @moonplist.Integer(42L),
            @moonplist.Integer(43L),
            @moonplist.Integer(44L),
            @moonplist.Integer(45L),
            @moonplist.Integer(46L),
            @moonplist.Integer(47L),
            @moonplist.Integer(48L),
            @moonplist.Integer(49L),
            @moonplist.Integer(50L),
            @moonplist.Integer(51L),
            @moonplist.Integer(52L),
            @moonplist.Integer(53L),
            @moonplist.Integer(54L),
            @moonplist.Integer(55L),
            @moonplist.Integer(56L),
            @moonplist.Integer(57L),
            @moonplist.Integer(58L),
            @moonplist.Integer(59L),
            @moonplist.Integer(60L),
            @moonplist.Integer(61L),
            @moonplist.Integer(62L),
            @moonplist.Integer(63L),
            @moonplist.Integer(64L),
            @moonplist.Integer(65L),
            @moonplist.Integer(66L),
            @moonplist.Integer(67L),
            @moonplist.Integer(68L),
            @moonplist.Integer(69L),
            @moonplist.Integer(70L),
            @moonplist.Integer(71L),
            @moonplist.Integer(72L),
            @moonplist.Integer(73L),
            @moonplist.Integer(74L),
            @moonplist.Integer(75L),
            @moonplist.Integer(76L),
            @moonplist.Integer(77L),
            @moonplist.Integer(78L),
            @moonplist.Integer(79L),
            @moonplist.Integer(80L),
            @moonplist.Integer(81L),
            @moonplist.Integer(82L),
            @moonplist.Integer(83L),
            @moonplist.Integer(84L),
            @moonplist.Integer(85L),
            @moonplist.Integer(86L),
            @moonplist.Integer(87L),
            @moonplist.Integer(88L),
            @moonplist.Integer(89L),
            @moonplist.Integer(90L),
            @moonplist.Integer(91L),
            @moonplist.Integer(92L),
            @moonplist.Integer(93L),
            @moonplist.Integer(94L),
            @moonplist.Integer(95L),
            @moonplist.Integer(96L),
            @moonplist.Integer(97L),
            @moonplist.Integer(98L),
            @moonplist.Integer(99L),
            @moonplist.Integer(100L),
            @moonplist.Integer(101L),
            @moonplist.Integer(102L),
            @moonplist.Integer(103L),
            @moonplist.Integer(104L),
            @moonplist.Integer(105L),
            @moonplist.Integer(106L),
            @moonplist.Integer(107L),
            @moonplist.Integer(108L),
            @moonplist.Integer(109L),
            @moonplist.Integer(110L),
            @moonplist.Integer(111L),
            @moonplist.Integer(112L),
            @moonplist.Integer(113L),
            @moonplist.Integer(114L),
            @moonplist.Integer(115L),
            @moonplist.Integer(116L),
            @moonplist.Integer(117L),
            @moonplist.Integer(118L),
            @moonplist.Integer(119L),
            @moonplist.Integer(120L),
            @moonplist.Integer(121L),
            @moonplist.Integer(122L),
            @moonplist.Integer(123L),
            @moonplist.Integer(124L),
            @moonplist.Integer(125L),
            @moonplist.Integer(126L),
            @moonplist.Integer(127L),
            @moonplist.Integer(128L),
            @moonplist.Integer(129L),
            @moonplist.Integer(130L),
            @moonplist.Integer(131L),
            @moonplist.Integer(132L),
            @moonplist.Integer(133L),
            @moonplist.Integer(134L),
            @moonplist.Integer(135L),
            @moonplist.Integer(136L),
            @moonplist.Integer(137L),
            @moonplist.Integer(138L),
            @moonplist.Integer(139L),
            @moonplist.Integer(140L),
            @moonplist.Integer(141L),
            @moonplist.Integer(142L),
            @moonplist.Integer(143L),
            @moonplist.Integer(144L),
            @moonplist.Integer(145L),
            @moonplist.Integer(146L),
            @moonplist.Integer(147L),
            @moonplist.Integer(148L),
            @moonplist.Integer(149L),
            @moonplist.Integer(150L),
            @moonplist.Integer(151L),
            @moonplist.Integer(152L),
            @moonplist.Integer(153L),
            @moonplist.Integer(154L),
            @moonplist.Integer(155L),
            @moonplist.Integer(156L),
            @moonplist.Integer(157L),
            @moonplist.Integer(158L),
            @moonplist.Integer(159L),
            @moonplist.Integer(160L),
            @moonplist.Integer(161L),
            @moonplist.Integer(162L),
            @moonplist.Integer(163L),
            @moonplist.Integer(164L),
            @moonplist.Integer(165L),
            @moonplist.Integer(166L),
            @moonplist.Integer(167L),
            @moonplist.Integer(168L),
            @moonplist.Integer(169L),
            @moonplist.Integer(170L),
            @moonplist.Integer(171L),
            @moonplist.Integer(172L),
            @moonplist.Integer(173L),
            @moonplist.Integer(174L),
            @moonplist.Integer(175L),
            @moonplist.Integer(176L),
            @moonplist.Integer(177L),
            @moonplist.Integer(178L),
            @moonplist.Integer(179L),
            @moonplist.Integer(180L),
            @moonplist.Integer(181L),
            @moonplist.Integer(182L),
            @moonplist.Integer(183L),
            @moonplist.Integer(184L),
            @moonplist.Integer(185L),
            @moonplist.Integer(186L),
            @moonplist.Integer(187L),
            @moonplist.Integer(188L),
            @moonplist.Integer(189L),
            @moonplist.Integer(190L),
            @moonplist.Integer(191L),
            @moonplist.Integer(192L),
            @moonplist.Integer(193L),
            @moonplist.Integer(194L),
            @moonplist.Integer(195L),
            @moonplist.Integer(196L),
            @moonplist.Integer(197L),
            @moonplist.Integer(198L),
            @moonplist.Integer(199L),
            @moonplist.Integer(200L),
            @moonplist.Integer(201L),
            @moonplist.Integer(202L),
            @moonplist.Integer(203L),
            @moonplist.Integer(204L),
            @moonplist.Integer(205L),
            @moonplist.Integer(206L),
            @moonplist.Integer(207L),
            @moonplist.Integer(208L),
            @moonplist.Integer(209L),
            @moonplist.Integer(210L),
            @moonplist.Integer(211L),
            @moonplist.Integer(212L),
            @moonplist.Integer(213L),
            @moonplist.Integer(214L),
            @moonplist.Integer(215L),
            @moonplist.Integer(216L),
            @moonplist.Integer(217L),
            @moonplist.Integer(218L),
            @moonplist.Integer(219L),
            @moonplist.Integer(220L),
            @moonplist.Integer(221L),
            @moonplist.Integer(222L),
            @moonplist.Integer(223L),
            @moonplist.Integer(224L),
            @moonplist.Integer(225L),
            @moonplist.Integer(226L),
            @moonplist.Integer(227L),
            @moonplist.Integer(228L),
            @moonplist.Integer(229L),
            @moonplist.Integer(230L),
            @moonplist.Integer(231L),
            @moonplist.Integer(232L),
            @moonplist.Integer(233L),
            @moonplist.Integer(234L),
            @moonplist.Integer(235L),
            @moonplist.Integer(236L),
            @moonplist.Integer(237L),
            @moonplist.Integer(238L),
            @moonplist.Integer(239L),
            @moonplist.Integer(240L),
            @moonplist.Integer(241L),
            @moonplist.Integer(242L),
            @moonplist.Integer(243L),
            @moonplist.Integer(244L),
            @moonplist.Integer(245L),
            @moonplist.Integer(246L),
            @moonplist.Integer(247L),
            @moonplist.Integer(248L),
            @moonplist.Integer(249L),
            @moonplist.Integer(250L),
            @moonplist.Integer(251L),
            @moonplist.Integer(252L),
            @moonplist.Integer(253L),
            @moonplist.Integer(254L),
            @moonplist.Integer(255L),
            @moonplist.Integer(256L),
            @moonplist.Integer(257L),
            @moonplist.Integer(258L),
            @moonplist.Integer(259L),
            @moonplist.Integer(260L),
            @moonplist.Integer(261L),
            @moonplist.Integer(262L),
            @moonplist.Integer(263L),
            @moonplist.Integer(264L),
            @moonplist.Integer(265L),
            @moonplist.Integer(266L),
            @moonplist.Integer(267L),
            @moonplist.Integer(268L),
            @moonplist.Integer(269L),
            @moonplist.Integer(270L),
            @moonplist.Integer(271L),
            @moonplist.Integer(272L),
            @moonplist.Integer(273L),
            @moonplist.Integer(274L),
            @moonplist.Integer(275L),
            @moonplist.Integer(276L),
            @moonplist.Integer(277L),
            @moonplist.Integer(278L),
            @moonplist.Integer(279L),
            @moonplist.Integer(280L),
            @moonplist.Integer(281L),
            @moonplist.Integer(282L),
            @moonplist.Integer(283L),
            @moonplist.Integer(284L),
            @moonplist.Integer(285L),
            @moonplist.Integer(286L),
            @moonplist.Integer(287L),
            @moonplist.Integer(288L),
            @moonplist.Integer(289L),
            @moonplist.Integer(290L),
            @moonplist.Integer(291L),
            @moonplist.Integer(292L),
            @moonplist.Integer(293L),
            @moonplist.Integer(294L),
            @moonplist.Integer(295L),
            @moonplist.Integer(296L),
            @moonplist.Integer(297L),
            @moonplist.Integer(298L),
            @moonplist.Integer(299L),
          ]),
          decoded,
        ),
      )
      println(
        "CASE:42:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.List([
        @moonplist.Integer(0L),
        @moonplist.Integer(1L),
        @moonplist.Integer(2L),
        @moonplist.Integer(3L),
        @moonplist.Integer(4L),
        @moonplist.Integer(5L),
        @moonplist.Integer(6L),
        @moonplist.Integer(7L),
        @moonplist.Integer(8L),
        @moonplist.Integer(9L),
        @moonplist.Integer(10L),
        @moonplist.Integer(11L),
        @moonplist.Integer(12L),
        @moonplist.Integer(13L),
        @moonplist.Integer(14L),
        @moonplist.Integer(15L),
        @moonplist.Integer(16L),
        @moonplist.Integer(17L),
        @moonplist.Integer(18L),
        @moonplist.Integer(19L),
        @moonplist.Integer(20L),
        @moonplist.Integer(21L),
        @moonplist.Integer(22L),
        @moonplist.Integer(23L),
        @moonplist.Integer(24L),
        @moonplist.Integer(25L),
        @moonplist.Integer(26L),
        @moonplist.Integer(27L),
        @moonplist.Integer(28L),
        @moonplist.Integer(29L),
        @moonplist.Integer(30L),
        @moonplist.Integer(31L),
        @moonplist.Integer(32L),
        @moonplist.Integer(33L),
        @moonplist.Integer(34L),
        @moonplist.Integer(35L),
        @moonplist.Integer(36L),
        @moonplist.Integer(37L),
        @moonplist.Integer(38L),
        @moonplist.Integer(39L),
        @moonplist.Integer(40L),
        @moonplist.Integer(41L),
        @moonplist.Integer(42L),
        @moonplist.Integer(43L),
        @moonplist.Integer(44L),
        @moonplist.Integer(45L),
        @moonplist.Integer(46L),
        @moonplist.Integer(47L),
        @moonplist.Integer(48L),
        @moonplist.Integer(49L),
        @moonplist.Integer(50L),
        @moonplist.Integer(51L),
        @moonplist.Integer(52L),
        @moonplist.Integer(53L),
        @moonplist.Integer(54L),
        @moonplist.Integer(55L),
        @moonplist.Integer(56L),
        @moonplist.Integer(57L),
        @moonplist.Integer(58L),
        @moonplist.Integer(59L),
        @moonplist.Integer(60L),
        @moonplist.Integer(61L),
        @moonplist.Integer(62L),
        @moonplist.Integer(63L),
        @moonplist.Integer(64L),
        @moonplist.Integer(65L),
        @moonplist.Integer(66L),
        @moonplist.Integer(67L),
        @moonplist.Integer(68L),
        @moonplist.Integer(69L),
        @moonplist.Integer(70L),
        @moonplist.Integer(71L),
        @moonplist.Integer(72L),
        @moonplist.Integer(73L),
        @moonplist.Integer(74L),
        @moonplist.Integer(75L),
        @moonplist.Integer(76L),
        @moonplist.Integer(77L),
        @moonplist.Integer(78L),
        @moonplist.Integer(79L),
        @moonplist.Integer(80L),
        @moonplist.Integer(81L),
        @moonplist.Integer(82L),
        @moonplist.Integer(83L),
        @moonplist.Integer(84L),
        @moonplist.Integer(85L),
        @moonplist.Integer(86L),
        @moonplist.Integer(87L),
        @moonplist.Integer(88L),
        @moonplist.Integer(89L),
        @moonplist.Integer(90L),
        @moonplist.Integer(91L),
        @moonplist.Integer(92L),
        @moonplist.Integer(93L),
        @moonplist.Integer(94L),
        @moonplist.Integer(95L),
        @moonplist.Integer(96L),
        @moonplist.Integer(97L),
        @moonplist.Integer(98L),
        @moonplist.Integer(99L),
        @moonplist.Integer(100L),
        @moonplist.Integer(101L),
        @moonplist.Integer(102L),
        @moonplist.Integer(103L),
        @moonplist.Integer(104L),
        @moonplist.Integer(105L),
        @moonplist.Integer(106L),
        @moonplist.Integer(107L),
        @moonplist.Integer(108L),
        @moonplist.Integer(109L),
        @moonplist.Integer(110L),
        @moonplist.Integer(111L),
        @moonplist.Integer(112L),
        @moonplist.Integer(113L),
        @moonplist.Integer(114L),
        @moonplist.Integer(115L),
        @moonplist.Integer(116L),
        @moonplist.Integer(117L),
        @moonplist.Integer(118L),
        @moonplist.Integer(119L),
        @moonplist.Integer(120L),
        @moonplist.Integer(121L),
        @moonplist.Integer(122L),
        @moonplist.Integer(123L),
        @moonplist.Integer(124L),
        @moonplist.Integer(125L),
        @moonplist.Integer(126L),
        @moonplist.Integer(127L),
        @moonplist.Integer(128L),
        @moonplist.Integer(129L),
        @moonplist.Integer(130L),
        @moonplist.Integer(131L),
        @moonplist.Integer(132L),
        @moonplist.Integer(133L),
        @moonplist.Integer(134L),
        @moonplist.Integer(135L),
        @moonplist.Integer(136L),
        @moonplist.Integer(137L),
        @moonplist.Integer(138L),
        @moonplist.Integer(139L),
        @moonplist.Integer(140L),
        @moonplist.Integer(141L),
        @moonplist.Integer(142L),
        @moonplist.Integer(143L),
        @moonplist.Integer(144L),
        @moonplist.Integer(145L),
        @moonplist.Integer(146L),
        @moonplist.Integer(147L),
        @moonplist.Integer(148L),
        @moonplist.Integer(149L),
        @moonplist.Integer(150L),
        @moonplist.Integer(151L),
        @moonplist.Integer(152L),
        @moonplist.Integer(153L),
        @moonplist.Integer(154L),
        @moonplist.Integer(155L),
        @moonplist.Integer(156L),
        @moonplist.Integer(157L),
        @moonplist.Integer(158L),
        @moonplist.Integer(159L),
        @moonplist.Integer(160L),
        @moonplist.Integer(161L),
        @moonplist.Integer(162L),
        @moonplist.Integer(163L),
        @moonplist.Integer(164L),
        @moonplist.Integer(165L),
        @moonplist.Integer(166L),
        @moonplist.Integer(167L),
        @moonplist.Integer(168L),
        @moonplist.Integer(169L),
        @moonplist.Integer(170L),
        @moonplist.Integer(171L),
        @moonplist.Integer(172L),
        @moonplist.Integer(173L),
        @moonplist.Integer(174L),
        @moonplist.Integer(175L),
        @moonplist.Integer(176L),
        @moonplist.Integer(177L),
        @moonplist.Integer(178L),
        @moonplist.Integer(179L),
        @moonplist.Integer(180L),
        @moonplist.Integer(181L),
        @moonplist.Integer(182L),
        @moonplist.Integer(183L),
        @moonplist.Integer(184L),
        @moonplist.Integer(185L),
        @moonplist.Integer(186L),
        @moonplist.Integer(187L),
        @moonplist.Integer(188L),
        @moonplist.Integer(189L),
        @moonplist.Integer(190L),
        @moonplist.Integer(191L),
        @moonplist.Integer(192L),
        @moonplist.Integer(193L),
        @moonplist.Integer(194L),
        @moonplist.Integer(195L),
        @moonplist.Integer(196L),
        @moonplist.Integer(197L),
        @moonplist.Integer(198L),
        @moonplist.Integer(199L),
        @moonplist.Integer(200L),
        @moonplist.Integer(201L),
        @moonplist.Integer(202L),
        @moonplist.Integer(203L),
        @moonplist.Integer(204L),
        @moonplist.Integer(205L),
        @moonplist.Integer(206L),
        @moonplist.Integer(207L),
        @moonplist.Integer(208L),
        @moonplist.Integer(209L),
        @moonplist.Integer(210L),
        @moonplist.Integer(211L),
        @moonplist.Integer(212L),
        @moonplist.Integer(213L),
        @moonplist.Integer(214L),
        @moonplist.Integer(215L),
        @moonplist.Integer(216L),
        @moonplist.Integer(217L),
        @moonplist.Integer(218L),
        @moonplist.Integer(219L),
        @moonplist.Integer(220L),
        @moonplist.Integer(221L),
        @moonplist.Integer(222L),
        @moonplist.Integer(223L),
        @moonplist.Integer(224L),
        @moonplist.Integer(225L),
        @moonplist.Integer(226L),
        @moonplist.Integer(227L),
        @moonplist.Integer(228L),
        @moonplist.Integer(229L),
        @moonplist.Integer(230L),
        @moonplist.Integer(231L),
        @moonplist.Integer(232L),
        @moonplist.Integer(233L),
        @moonplist.Integer(234L),
        @moonplist.Integer(235L),
        @moonplist.Integer(236L),
        @moonplist.Integer(237L),
        @moonplist.Integer(238L),
        @moonplist.Integer(239L),
        @moonplist.Integer(240L),
        @moonplist.Integer(241L),
        @moonplist.Integer(242L),
        @moonplist.Integer(243L),
        @moonplist.Integer(244L),
        @moonplist.Integer(245L),
        @moonplist.Integer(246L),
        @moonplist.Integer(247L),
        @moonplist.Integer(248L),
        @moonplist.Integer(249L),
        @moonplist.Integer(250L),
        @moonplist.Integer(251L),
        @moonplist.Integer(252L),
        @moonplist.Integer(253L),
        @moonplist.Integer(254L),
        @moonplist.Integer(255L),
        @moonplist.Integer(256L),
        @moonplist.Integer(257L),
        @moonplist.Integer(258L),
        @moonplist.Integer(259L),
        @moonplist.Integer(260L),
        @moonplist.Integer(261L),
        @moonplist.Integer(262L),
        @moonplist.Integer(263L),
        @moonplist.Integer(264L),
        @moonplist.Integer(265L),
        @moonplist.Integer(266L),
        @moonplist.Integer(267L),
        @moonplist.Integer(268L),
        @moonplist.Integer(269L),
        @moonplist.Integer(270L),
        @moonplist.Integer(271L),
        @moonplist.Integer(272L),
        @moonplist.Integer(273L),
        @moonplist.Integer(274L),
        @moonplist.Integer(275L),
        @moonplist.Integer(276L),
        @moonplist.Integer(277L),
        @moonplist.Integer(278L),
        @moonplist.Integer(279L),
        @moonplist.Integer(280L),
        @moonplist.Integer(281L),
        @moonplist.Integer(282L),
        @moonplist.Integer(283L),
        @moonplist.Integer(284L),
        @moonplist.Integer(285L),
        @moonplist.Integer(286L),
        @moonplist.Integer(287L),
        @moonplist.Integer(288L),
        @moonplist.Integer(289L),
        @moonplist.Integer(290L),
        @moonplist.Integer(291L),
        @moonplist.Integer(292L),
        @moonplist.Integer(293L),
        @moonplist.Integer(294L),
        @moonplist.Integer(295L),
        @moonplist.Integer(296L),
        @moonplist.Integer(297L),
        @moonplist.Integer(298L),
        @moonplist.Integer(299L),
      ])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c61727261793e0a093c696e74656765723e303c2f696e74656765723e0a093c696e74656765723e313c2f696e74656765723e0a093c696e74656765723e323c2f696e74656765723e0a093c696e74656765723e333c2f696e74656765723e0a093c696e74656765723e343c2f696e74656765723e0a093c696e74656765723e353c2f696e74656765723e0a093c696e74656765723e363c2f696e74656765723e0a093c696e74656765723e373c2f696e74656765723e0a093c696e74656765723e383c2f696e74656765723e0a093c696e74656765723e393c2f696e74656765723e0a093c696e74656765723e31303c2f696e74656765723e0a093c696e74656765723e31313c2f696e74656765723e0a093c696e74656765723e31323c2f696e74656765723e0a093c696e74656765723e31333c2f696e74656765723e0a093c696e74656765723e31343c2f696e74656765723e0a093c696e74656765723e31353c2f696e74656765723e0a093c696e74656765723e31363c2f696e74656765723e0a093c696e74656765723e31373c2f696e74656765723e0a093c696e74656765723e31383c2f696e74656765723e0a093c696e74656765723e31393c2f696e74656765723e0a093c696e74656765723e32303c2f696e74656765723e0a093c696e74656765723e32313c2f696e74656765723e0a093c696e74656765723e32323c2f696e74656765723e0a093c696e74656765723e32333c2f696e74656765723e0a093c696e74656765723e32343c2f696e74656765723e0a093c696e74656765723e32353c2f696e74656765723e0a093c696e74656765723e32363c2f696e74656765723e0a093c696e74656765723e32373c2f696e74656765723e0a093c696e74656765723e32383c2f696e74656765723e0a093c696e74656765723e32393c2f696e74656765723e0a093c696e74656765723e33303c2f696e74656765723e0a093c696e74656765723e33313c2f696e74656765723e0a093c696e74656765723e33323c2f696e74656765723e0a093c696e74656765723e33333c2f696e74656765723e0a093c696e74656765723e33343c2f696e74656765723e0a093c696e74656765723e33353c2f696e74656765723e0a093c696e74656765723e33363c2f696e74656765723e0a093c696e74656765723e33373c2f696e74656765723e0a093c696e74656765723e33383c2f696e74656765723e0a093c696e74656765723e33393c2f696e74656765723e0a093c696e74656765723e34303c2f696e74656765723e0a093c696e74656765723e34313c2f696e74656765723e0a093c696e74656765723e34323c2f696e74656765723e0a093c696e74656765723e34333c2f696e74656765723e0a093c696e74656765723e34343c2f696e74656765723e0a093c696e74656765723e34353c2f696e74656765723e0a093c696e74656765723e34363c2f696e74656765723e0a093c696e74656765723e34373c2f696e74656765723e0a093c696e74656765723e34383c2f696e74656765723e0a093c696e74656765723e34393c2f696e74656765723e0a093c696e74656765723e35303c2f696e74656765723e0a093c696e74656765723e35313c2f696e74656765723e0a093c696e74656765723e35323c2f696e74656765723e0a093c696e74656765723e35333c2f696e74656765723e0a093c696e74656765723e35343c2f696e74656765723e0a093c696e74656765723e35353c2f696e74656765723e0a093c696e74656765723e35363c2f696e74656765723e0a093c696e74656765723e35373c2f696e74656765723e0a093c696e74656765723e35383c2f696e74656765723e0a093c696e74656765723e35393c2f696e74656765723e0a093c696e74656765723e36303c2f696e74656765723e0a093c696e74656765723e36313c2f696e74656765723e0a093c696e74656765723e36323c2f696e74656765723e0a093c696e74656765723e36333c2f696e74656765723e0a093c696e74656765723e36343c2f696e74656765723e0a093c696e74656765723e36353c2f696e74656765723e0a093c696e74656765723e36363c2f696e74656765723e0a093c696e74656765723e36373c2f696e74656765723e0a093c696e74656765723e36383c2f696e74656765723e0a093c696e74656765723e36393c2f696e74656765723e0a093c696e74656765723e37303c2f696e74656765723e0a093c696e74656765723e37313c2f696e74656765723e0a093c696e74656765723e37323c2f696e74656765723e0a093c696e74656765723e37333c2f696e74656765723e0a093c696e74656765723e37343c2f696e74656765723e0a093c696e74656765723e37353c2f696e74656765723e0a093c696e74656765723e37363c2f696e74656765723e0a093c696e74656765723e37373c2f696e74656765723e0a093c696e74656765723e37383c2f696e74656765723e0a093c696e74656765723e37393c2f696e74656765723e0a093c696e74656765723e38303c2f696e74656765723e0a093c696e74656765723e38313c2f696e74656765723e0a093c696e74656765723e38323c2f696e74656765723e0a093c696e74656765723e38333c2f696e74656765723e0a093c696e74656765723e38343c2f696e74656765723e0a093c696e74656765723e38353c2f696e74656765723e0a093c696e74656765723e38363c2f696e74656765723e0a093c696e74656765723e38373c2f696e74656765723e0a093c696e74656765723e38383c2f696e74656765723e0a093c696e74656765723e38393c2f696e74656765723e0a093c696e74656765723e39303c2f696e74656765723e0a093c696e74656765723e39313c2f696e74656765723e0a093c696e74656765723e39323c2f696e74656765723e0a093c696e74656765723e39333c2f696e74656765723e0a093c696e74656765723e39343c2f696e74656765723e0a093c696e74656765723e39353c2f696e74656765723e0a093c696e74656765723e39363c2f696e74656765723e0a093c696e74656765723e39373c2f696e74656765723e0a093c696e74656765723e39383c2f696e74656765723e0a093c696e74656765723e39393c2f696e74656765723e0a093c696e74656765723e3130303c2f696e74656765723e0a093c696e74656765723e3130313c2f696e74656765723e0a093c696e74656765723e3130323c2f696e74656765723e0a093c696e74656765723e3130333c2f696e74656765723e0a093c696e74656765723e3130343c2f696e74656765723e0a093c696e74656765723e3130353c2f696e74656765723e0a093c696e74656765723e3130363c2f696e74656765723e0a093c696e74656765723e3130373c2f696e74656765723e0a093c696e74656765723e3130383c2f696e74656765723e0a093c696e74656765723e3130393c2f696e74656765723e0a093c696e74656765723e3131303c2f696e74656765723e0a093c696e74656765723e3131313c2f696e74656765723e0a093c696e74656765723e3131323c2f696e74656765723e0a093c696e74656765723e3131333c2f696e74656765723e0a093c696e74656765723e3131343c2f696e74656765723e0a093c696e74656765723e3131353c2f696e74656765723e0a093c696e74656765723e3131363c2f696e74656765723e0a093c696e74656765723e3131373c2f696e74656765723e0a093c696e74656765723e3131383c2f696e74656765723e0a093c696e74656765723e3131393c2f696e74656765723e0a093c696e74656765723e3132303c2f696e74656765723e0a093c696e74656765723e3132313c2f696e74656765723e0a093c696e74656765723e3132323c2f696e74656765723e0a093c696e74656765723e3132333c2f696e74656765723e0a093c696e74656765723e3132343c2f696e74656765723e0a093c696e74656765723e3132353c2f696e74656765723e0a093c696e74656765723e3132363c2f696e74656765723e0a093c696e74656765723e3132373c2f696e74656765723e0a093c696e74656765723e3132383c2f696e74656765723e0a093c696e74656765723e3132393c2f696e74656765723e0a093c696e74656765723e3133303c2f696e74656765723e0a093c696e74656765723e3133313c2f696e74656765723e0a093c696e74656765723e3133323c2f696e74656765723e0a093c696e74656765723e3133333c2f696e74656765723e0a093c696e74656765723e3133343c2f696e74656765723e0a093c696e74656765723e3133353c2f696e74656765723e0a093c696e74656765723e3133363c2f696e74656765723e0a093c696e74656765723e3133373c2f696e74656765723e0a093c696e74656765723e3133383c2f696e74656765723e0a093c696e74656765723e3133393c2f696e74656765723e0a093c696e74656765723e3134303c2f696e74656765723e0a093c696e74656765723e3134313c2f696e74656765723e0a093c696e74656765723e3134323c2f696e74656765723e0a093c696e74656765723e3134333c2f696e74656765723e0a093c696e74656765723e3134343c2f696e74656765723e0a093c696e74656765723e3134353c2f696e74656765723e0a093c696e74656765723e3134363c2f696e74656765723e0a093c696e74656765723e3134373c2f696e74656765723e0a093c696e74656765723e3134383c2f696e74656765723e0a093c696e74656765723e3134393c2f696e74656765723e0a093c696e74656765723e3135303c2f696e74656765723e0a093c696e74656765723e3135313c2f696e74656765723e0a093c696e74656765723e3135323c2f696e74656765723e0a093c696e74656765723e3135333c2f696e74656765723e0a093c696e74656765723e3135343c2f696e74656765723e0a093c696e74656765723e3135353c2f696e74656765723e0a093c696e74656765723e3135363c2f696e74656765723e0a093c696e74656765723e3135373c2f696e74656765723e0a093c696e74656765723e3135383c2f696e74656765723e0a093c696e74656765723e3135393c2f696e74656765723e0a093c696e74656765723e3136303c2f696e74656765723e0a093c696e74656765723e3136313c2f696e74656765723e0a093c696e74656765723e3136323c2f696e74656765723e0a093c696e74656765723e3136333c2f696e74656765723e0a093c696e74656765723e3136343c2f696e74656765723e0a093c696e74656765723e3136353c2f696e74656765723e0a093c696e74656765723e3136363c2f696e74656765723e0a093c696e74656765723e3136373c2f696e74656765723e0a093c696e74656765723e3136383c2f696e74656765723e0a093c696e74656765723e3136393c2f696e74656765723e0a093c696e74656765723e3137303c2f696e74656765723e0a093c696e74656765723e3137313c2f696e74656765723e0a093c696e74656765723e3137323c2f696e74656765723e0a093c696e74656765723e3137333c2f696e74656765723e0a093c696e74656765723e3137343c2f696e74656765723e0a093c696e74656765723e3137353c2f696e74656765723e0a093c696e74656765723e3137363c2f696e74656765723e0a093c696e74656765723e3137373c2f696e74656765723e0a093c696e74656765723e3137383c2f696e74656765723e0a093c696e74656765723e3137393c2f696e74656765723e0a093c696e74656765723e3138303c2f696e74656765723e0a093c696e74656765723e3138313c2f696e74656765723e0a093c696e74656765723e3138323c2f696e74656765723e0a093c696e74656765723e3138333c2f696e74656765723e0a093c696e74656765723e3138343c2f696e74656765723e0a093c696e74656765723e3138353c2f696e74656765723e0a093c696e74656765723e3138363c2f696e74656765723e0a093c696e74656765723e3138373c2f696e74656765723e0a093c696e74656765723e3138383c2f696e74656765723e0a093c696e74656765723e3138393c2f696e74656765723e0a093c696e74656765723e3139303c2f696e74656765723e0a093c696e74656765723e3139313c2f696e74656765723e0a093c696e74656765723e3139323c2f696e74656765723e0a093c696e74656765723e3139333c2f696e74656765723e0a093c696e74656765723e3139343c2f696e74656765723e0a093c696e74656765723e3139353c2f696e74656765723e0a093c696e74656765723e3139363c2f696e74656765723e0a093c696e74656765723e3139373c2f696e74656765723e0a093c696e74656765723e3139383c2f696e74656765723e0a093c696e74656765723e3139393c2f696e74656765723e0a093c696e74656765723e3230303c2f696e74656765723e0a093c696e74656765723e3230313c2f696e74656765723e0a093c696e74656765723e3230323c2f696e74656765723e0a093c696e74656765723e3230333c2f696e74656765723e0a093c696e74656765723e3230343c2f696e74656765723e0a093c696e74656765723e3230353c2f696e74656765723e0a093c696e74656765723e3230363c2f696e74656765723e0a093c696e74656765723e3230373c2f696e74656765723e0a093c696e74656765723e3230383c2f696e74656765723e0a093c696e74656765723e3230393c2f696e74656765723e0a093c696e74656765723e3231303c2f696e74656765723e0a093c696e74656765723e3231313c2f696e74656765723e0a093c696e74656765723e3231323c2f696e74656765723e0a093c696e74656765723e3231333c2f696e74656765723e0a093c696e74656765723e3231343c2f696e74656765723e0a093c696e74656765723e3231353c2f696e74656765723e0a093c696e74656765723e3231363c2f696e74656765723e0a093c696e74656765723e3231373c2f696e74656765723e0a093c696e74656765723e3231383c2f696e74656765723e0a093c696e74656765723e3231393c2f696e74656765723e0a093c696e74656765723e3232303c2f696e74656765723e0a093c696e74656765723e3232313c2f696e74656765723e0a093c696e74656765723e3232323c2f696e74656765723e0a093c696e74656765723e3232333c2f696e74656765723e0a093c696e74656765723e3232343c2f696e74656765723e0a093c696e74656765723e3232353c2f696e74656765723e0a093c696e74656765723e3232363c2f696e74656765723e0a093c696e74656765723e3232373c2f696e74656765723e0a093c696e74656765723e3232383c2f696e74656765723e0a093c696e74656765723e3232393c2f696e74656765723e0a093c696e74656765723e3233303c2f696e74656765723e0a093c696e74656765723e3233313c2f696e74656765723e0a093c696e74656765723e3233323c2f696e74656765723e0a093c696e74656765723e3233333c2f696e74656765723e0a093c696e74656765723e3233343c2f696e74656765723e0a093c696e74656765723e3233353c2f696e74656765723e0a093c696e74656765723e3233363c2f696e74656765723e0a093c696e74656765723e3233373c2f696e74656765723e0a093c696e74656765723e3233383c2f696e74656765723e0a093c696e74656765723e3233393c2f696e74656765723e0a093c696e74656765723e3234303c2f696e74656765723e0a093c696e74656765723e3234313c2f696e74656765723e0a093c696e74656765723e3234323c2f696e74656765723e0a093c696e74656765723e3234333c2f696e74656765723e0a093c696e74656765723e3234343c2f696e74656765723e0a093c696e74656765723e3234353c2f696e74656765723e0a093c696e74656765723e3234363c2f696e74656765723e0a093c696e74656765723e3234373c2f696e74656765723e0a093c696e74656765723e3234383c2f696e74656765723e0a093c696e74656765723e3234393c2f696e74656765723e0a093c696e74656765723e3235303c2f696e74656765723e0a093c696e74656765723e3235313c2f696e74656765723e0a093c696e74656765723e3235323c2f696e74656765723e0a093c696e74656765723e3235333c2f696e74656765723e0a093c696e74656765723e3235343c2f696e74656765723e0a093c696e74656765723e3235353c2f696e74656765723e0a093c696e74656765723e3235363c2f696e74656765723e0a093c696e74656765723e3235373c2f696e74656765723e0a093c696e74656765723e3235383c2f696e74656765723e0a093c696e74656765723e3235393c2f696e74656765723e0a093c696e74656765723e3236303c2f696e74656765723e0a093c696e74656765723e3236313c2f696e74656765723e0a093c696e74656765723e3236323c2f696e74656765723e0a093c696e74656765723e3236333c2f696e74656765723e0a093c696e74656765723e3236343c2f696e74656765723e0a093c696e74656765723e3236353c2f696e74656765723e0a093c696e74656765723e3236363c2f696e74656765723e0a093c696e74656765723e3236373c2f696e74656765723e0a093c696e74656765723e3236383c2f696e74656765723e0a093c696e74656765723e3236393c2f696e74656765723e0a093c696e74656765723e3237303c2f696e74656765723e0a093c696e74656765723e3237313c2f696e74656765723e0a093c696e74656765723e3237323c2f696e74656765723e0a093c696e74656765723e3237333c2f696e74656765723e0a093c696e74656765723e3237343c2f696e74656765723e0a093c696e74656765723e3237353c2f696e74656765723e0a093c696e74656765723e3237363c2f696e74656765723e0a093c696e74656765723e3237373c2f696e74656765723e0a093c696e74656765723e3237383c2f696e74656765723e0a093c696e74656765723e3237393c2f696e74656765723e0a093c696e74656765723e3238303c2f696e74656765723e0a093c696e74656765723e3238313c2f696e74656765723e0a093c696e74656765723e3238323c2f696e74656765723e0a093c696e74656765723e3238333c2f696e74656765723e0a093c696e74656765723e3238343c2f696e74656765723e0a093c696e74656765723e3238353c2f696e74656765723e0a093c696e74656765723e3238363c2f696e74656765723e0a093c696e74656765723e3238373c2f696e74656765723e0a093c696e74656765723e3238383c2f696e74656765723e0a093c696e74656765723e3238393c2f696e74656765723e0a093c696e74656765723e3239303c2f696e74656765723e0a093c696e74656765723e3239313c2f696e74656765723e0a093c696e74656765723e3239323c2f696e74656765723e0a093c696e74656765723e3239333c2f696e74656765723e0a093c696e74656765723e3239343c2f696e74656765723e0a093c696e74656765723e3239353c2f696e74656765723e0a093c696e74656765723e3239363c2f696e74656765723e0a093c696e74656765723e3239373c2f696e74656765723e0a093c696e74656765723e3239383c2f696e74656765723e0a093c696e74656765723e3239393c2f696e74656765723e0a3c2f61727261793e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.List([
            @moonplist.Integer(0L),
            @moonplist.Integer(1L),
            @moonplist.Integer(2L),
            @moonplist.Integer(3L),
            @moonplist.Integer(4L),
            @moonplist.Integer(5L),
            @moonplist.Integer(6L),
            @moonplist.Integer(7L),
            @moonplist.Integer(8L),
            @moonplist.Integer(9L),
            @moonplist.Integer(10L),
            @moonplist.Integer(11L),
            @moonplist.Integer(12L),
            @moonplist.Integer(13L),
            @moonplist.Integer(14L),
            @moonplist.Integer(15L),
            @moonplist.Integer(16L),
            @moonplist.Integer(17L),
            @moonplist.Integer(18L),
            @moonplist.Integer(19L),
            @moonplist.Integer(20L),
            @moonplist.Integer(21L),
            @moonplist.Integer(22L),
            @moonplist.Integer(23L),
            @moonplist.Integer(24L),
            @moonplist.Integer(25L),
            @moonplist.Integer(26L),
            @moonplist.Integer(27L),
            @moonplist.Integer(28L),
            @moonplist.Integer(29L),
            @moonplist.Integer(30L),
            @moonplist.Integer(31L),
            @moonplist.Integer(32L),
            @moonplist.Integer(33L),
            @moonplist.Integer(34L),
            @moonplist.Integer(35L),
            @moonplist.Integer(36L),
            @moonplist.Integer(37L),
            @moonplist.Integer(38L),
            @moonplist.Integer(39L),
            @moonplist.Integer(40L),
            @moonplist.Integer(41L),
            @moonplist.Integer(42L),
            @moonplist.Integer(43L),
            @moonplist.Integer(44L),
            @moonplist.Integer(45L),
            @moonplist.Integer(46L),
            @moonplist.Integer(47L),
            @moonplist.Integer(48L),
            @moonplist.Integer(49L),
            @moonplist.Integer(50L),
            @moonplist.Integer(51L),
            @moonplist.Integer(52L),
            @moonplist.Integer(53L),
            @moonplist.Integer(54L),
            @moonplist.Integer(55L),
            @moonplist.Integer(56L),
            @moonplist.Integer(57L),
            @moonplist.Integer(58L),
            @moonplist.Integer(59L),
            @moonplist.Integer(60L),
            @moonplist.Integer(61L),
            @moonplist.Integer(62L),
            @moonplist.Integer(63L),
            @moonplist.Integer(64L),
            @moonplist.Integer(65L),
            @moonplist.Integer(66L),
            @moonplist.Integer(67L),
            @moonplist.Integer(68L),
            @moonplist.Integer(69L),
            @moonplist.Integer(70L),
            @moonplist.Integer(71L),
            @moonplist.Integer(72L),
            @moonplist.Integer(73L),
            @moonplist.Integer(74L),
            @moonplist.Integer(75L),
            @moonplist.Integer(76L),
            @moonplist.Integer(77L),
            @moonplist.Integer(78L),
            @moonplist.Integer(79L),
            @moonplist.Integer(80L),
            @moonplist.Integer(81L),
            @moonplist.Integer(82L),
            @moonplist.Integer(83L),
            @moonplist.Integer(84L),
            @moonplist.Integer(85L),
            @moonplist.Integer(86L),
            @moonplist.Integer(87L),
            @moonplist.Integer(88L),
            @moonplist.Integer(89L),
            @moonplist.Integer(90L),
            @moonplist.Integer(91L),
            @moonplist.Integer(92L),
            @moonplist.Integer(93L),
            @moonplist.Integer(94L),
            @moonplist.Integer(95L),
            @moonplist.Integer(96L),
            @moonplist.Integer(97L),
            @moonplist.Integer(98L),
            @moonplist.Integer(99L),
            @moonplist.Integer(100L),
            @moonplist.Integer(101L),
            @moonplist.Integer(102L),
            @moonplist.Integer(103L),
            @moonplist.Integer(104L),
            @moonplist.Integer(105L),
            @moonplist.Integer(106L),
            @moonplist.Integer(107L),
            @moonplist.Integer(108L),
            @moonplist.Integer(109L),
            @moonplist.Integer(110L),
            @moonplist.Integer(111L),
            @moonplist.Integer(112L),
            @moonplist.Integer(113L),
            @moonplist.Integer(114L),
            @moonplist.Integer(115L),
            @moonplist.Integer(116L),
            @moonplist.Integer(117L),
            @moonplist.Integer(118L),
            @moonplist.Integer(119L),
            @moonplist.Integer(120L),
            @moonplist.Integer(121L),
            @moonplist.Integer(122L),
            @moonplist.Integer(123L),
            @moonplist.Integer(124L),
            @moonplist.Integer(125L),
            @moonplist.Integer(126L),
            @moonplist.Integer(127L),
            @moonplist.Integer(128L),
            @moonplist.Integer(129L),
            @moonplist.Integer(130L),
            @moonplist.Integer(131L),
            @moonplist.Integer(132L),
            @moonplist.Integer(133L),
            @moonplist.Integer(134L),
            @moonplist.Integer(135L),
            @moonplist.Integer(136L),
            @moonplist.Integer(137L),
            @moonplist.Integer(138L),
            @moonplist.Integer(139L),
            @moonplist.Integer(140L),
            @moonplist.Integer(141L),
            @moonplist.Integer(142L),
            @moonplist.Integer(143L),
            @moonplist.Integer(144L),
            @moonplist.Integer(145L),
            @moonplist.Integer(146L),
            @moonplist.Integer(147L),
            @moonplist.Integer(148L),
            @moonplist.Integer(149L),
            @moonplist.Integer(150L),
            @moonplist.Integer(151L),
            @moonplist.Integer(152L),
            @moonplist.Integer(153L),
            @moonplist.Integer(154L),
            @moonplist.Integer(155L),
            @moonplist.Integer(156L),
            @moonplist.Integer(157L),
            @moonplist.Integer(158L),
            @moonplist.Integer(159L),
            @moonplist.Integer(160L),
            @moonplist.Integer(161L),
            @moonplist.Integer(162L),
            @moonplist.Integer(163L),
            @moonplist.Integer(164L),
            @moonplist.Integer(165L),
            @moonplist.Integer(166L),
            @moonplist.Integer(167L),
            @moonplist.Integer(168L),
            @moonplist.Integer(169L),
            @moonplist.Integer(170L),
            @moonplist.Integer(171L),
            @moonplist.Integer(172L),
            @moonplist.Integer(173L),
            @moonplist.Integer(174L),
            @moonplist.Integer(175L),
            @moonplist.Integer(176L),
            @moonplist.Integer(177L),
            @moonplist.Integer(178L),
            @moonplist.Integer(179L),
            @moonplist.Integer(180L),
            @moonplist.Integer(181L),
            @moonplist.Integer(182L),
            @moonplist.Integer(183L),
            @moonplist.Integer(184L),
            @moonplist.Integer(185L),
            @moonplist.Integer(186L),
            @moonplist.Integer(187L),
            @moonplist.Integer(188L),
            @moonplist.Integer(189L),
            @moonplist.Integer(190L),
            @moonplist.Integer(191L),
            @moonplist.Integer(192L),
            @moonplist.Integer(193L),
            @moonplist.Integer(194L),
            @moonplist.Integer(195L),
            @moonplist.Integer(196L),
            @moonplist.Integer(197L),
            @moonplist.Integer(198L),
            @moonplist.Integer(199L),
            @moonplist.Integer(200L),
            @moonplist.Integer(201L),
            @moonplist.Integer(202L),
            @moonplist.Integer(203L),
            @moonplist.Integer(204L),
            @moonplist.Integer(205L),
            @moonplist.Integer(206L),
            @moonplist.Integer(207L),
            @moonplist.Integer(208L),
            @moonplist.Integer(209L),
            @moonplist.Integer(210L),
            @moonplist.Integer(211L),
            @moonplist.Integer(212L),
            @moonplist.Integer(213L),
            @moonplist.Integer(214L),
            @moonplist.Integer(215L),
            @moonplist.Integer(216L),
            @moonplist.Integer(217L),
            @moonplist.Integer(218L),
            @moonplist.Integer(219L),
            @moonplist.Integer(220L),
            @moonplist.Integer(221L),
            @moonplist.Integer(222L),
            @moonplist.Integer(223L),
            @moonplist.Integer(224L),
            @moonplist.Integer(225L),
            @moonplist.Integer(226L),
            @moonplist.Integer(227L),
            @moonplist.Integer(228L),
            @moonplist.Integer(229L),
            @moonplist.Integer(230L),
            @moonplist.Integer(231L),
            @moonplist.Integer(232L),
            @moonplist.Integer(233L),
            @moonplist.Integer(234L),
            @moonplist.Integer(235L),
            @moonplist.Integer(236L),
            @moonplist.Integer(237L),
            @moonplist.Integer(238L),
            @moonplist.Integer(239L),
            @moonplist.Integer(240L),
            @moonplist.Integer(241L),
            @moonplist.Integer(242L),
            @moonplist.Integer(243L),
            @moonplist.Integer(244L),
            @moonplist.Integer(245L),
            @moonplist.Integer(246L),
            @moonplist.Integer(247L),
            @moonplist.Integer(248L),
            @moonplist.Integer(249L),
            @moonplist.Integer(250L),
            @moonplist.Integer(251L),
            @moonplist.Integer(252L),
            @moonplist.Integer(253L),
            @moonplist.Integer(254L),
            @moonplist.Integer(255L),
            @moonplist.Integer(256L),
            @moonplist.Integer(257L),
            @moonplist.Integer(258L),
            @moonplist.Integer(259L),
            @moonplist.Integer(260L),
            @moonplist.Integer(261L),
            @moonplist.Integer(262L),
            @moonplist.Integer(263L),
            @moonplist.Integer(264L),
            @moonplist.Integer(265L),
            @moonplist.Integer(266L),
            @moonplist.Integer(267L),
            @moonplist.Integer(268L),
            @moonplist.Integer(269L),
            @moonplist.Integer(270L),
            @moonplist.Integer(271L),
            @moonplist.Integer(272L),
            @moonplist.Integer(273L),
            @moonplist.Integer(274L),
            @moonplist.Integer(275L),
            @moonplist.Integer(276L),
            @moonplist.Integer(277L),
            @moonplist.Integer(278L),
            @moonplist.Integer(279L),
            @moonplist.Integer(280L),
            @moonplist.Integer(281L),
            @moonplist.Integer(282L),
            @moonplist.Integer(283L),
            @moonplist.Integer(284L),
            @moonplist.Integer(285L),
            @moonplist.Integer(286L),
            @moonplist.Integer(287L),
            @moonplist.Integer(288L),
            @moonplist.Integer(289L),
            @moonplist.Integer(290L),
            @moonplist.Integer(291L),
            @moonplist.Integer(292L),
            @moonplist.Integer(293L),
            @moonplist.Integer(294L),
            @moonplist.Integer(295L),
            @moonplist.Integer(296L),
            @moonplist.Integer(297L),
            @moonplist.Integer(298L),
            @moonplist.Integer(299L),
          ]),
          decoded,
        ),
      )
      println(
        "CASE:43:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Data(
        @moonplist.decode_hex("71c2d99fa1bd328ccb"),
      )
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c69737430304971c2d99fa1bd328ccb080000000000000101000000000000000100000000000000000000000000000012",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(@moonplist.decode_hex("71c2d99fa1bd328ccb")),
          decoded,
        ),
      )
      println(
        "CASE:44:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Data(
        @moonplist.decode_hex("71c2d99fa1bd328ccb"),
      )
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646174613e0a63634c5a6e3647394d6f7a4c0a3c2f646174613e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(@moonplist.decode_hex("71c2d99fa1bd328ccb")),
          decoded,
        ),
      )
      println(
        "CASE:45:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Text("")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303050080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Text(""), decoded))
      println(
        "CASE:46:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Text("")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c737472696e673e3c2f737472696e673e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Text(""), decoded))
      println(
        "CASE:47:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Data(
        @moonplist.decode_hex(
          "41a55549cf336c83cbb3a9fb99a48c32816f218e511860f299a0b4964e7fb8ee38d5",
        ),
      )
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c69737430304f102241a55549cf336c83cbb3a9fb99a48c32816f218e511860f299a0b4964e7fb8ee38d508000000000000010100000000000000010000000000000000000000000000002d",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(
            @moonplist.decode_hex(
              "41a55549cf336c83cbb3a9fb99a48c32816f218e511860f299a0b4964e7fb8ee38d5",
            ),
          ),
          decoded,
        ),
      )
      println(
        "CASE:48:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Data(
        @moonplist.decode_hex(
          "41a55549cf336c83cbb3a9fb99a48c32816f218e511860f299a0b4964e7fb8ee38d5",
        ),
      )
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646174613e0a516156565363387a6249504c73366e376d61534d4d6f467649593552474744796d6143306c6b352f754f343431513d3d0a3c2f646174613e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(
            @moonplist.decode_hex(
              "41a55549cf336c83cbb3a9fb99a48c32816f218e511860f299a0b4964e7fb8ee38d5",
            ),
          ),
          decoded,
        ),
      )
      println(
        "CASE:49:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Text("汉字🍎 <&>\r\n790")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c69737430306d6c495b57d83cdf4e0020003c0026003e000d000a003700390030080000000000000101000000000000000100000000000000000000000000000023",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Text("汉字🍎 <&>\r\n790"), decoded),
      )
      println(
        "CASE:50:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Text("汉字🍎 <&>\r\n790")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c737472696e673ee6b189e5ad97f09f8d8e20266c743b26616d703b2667743b0a3739303c2f737472696e673e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Text("汉字🍎 <&>\n790"), decoded),
      )
      println(
        "CASE:51:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Text("汉字🍎 <&>\r\n810")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c69737430306d6c495b57d83cdf4e0020003c0026003e000d000a003800310030080000000000000101000000000000000100000000000000000000000000000023",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Text("汉字🍎 <&>\r\n810"), decoded),
      )
      println(
        "CASE:52:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Text("汉字🍎 <&>\r\n810")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c737472696e673ee6b189e5ad97f09f8d8e20266c743b26616d703b2667743b0a3831303c2f737472696e673e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Text("汉字🍎 <&>\n810"), decoded),
      )
      println(
        "CASE:53:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Integer(1239026353745862064L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030131131e7e7725e9db0080000000000000101000000000000000100000000000000000000000000000011",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Integer(1239026353745862064L), decoded),
      )
      println(
        "CASE:54:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Integer(1239026353745862064L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c696e74656765723e313233393032363335333734353836323036343c2f696e74656765723e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Integer(1239026353745862064L), decoded),
      )
      println(
        "CASE:55:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Text("")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303050080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Text(""), decoded))
      println(
        "CASE:56:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Text("")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c737472696e673e3c2f737472696e673e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Text(""), decoded))
      println(
        "CASE:57:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Date(730902659.0)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c69737430303341c5c85841800000080000000000000101000000000000000100000000000000000000000000000011",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Date(730902659.0), decoded))
      println(
        "CASE:58:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Date(730902659.0)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646174653e323032342d30322d32395431323a33303a35395a3c2f646174653e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Date(730902659.0), decoded))
      println(
        "CASE:59:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Boolean(true)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303009080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(true), decoded))
      println(
        "CASE:60:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Boolean(true)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c747275652f3e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(true), decoded))
      println(
        "CASE:61:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Data(
        @moonplist.decode_hex("9cc3ee4daaf8cb003902e9"),
      )
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c69737430304b9cc3ee4daaf8cb003902e9080000000000000101000000000000000100000000000000000000000000000014",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(@moonplist.decode_hex("9cc3ee4daaf8cb003902e9")),
          decoded,
        ),
      )
      println(
        "CASE:62:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Data(
        @moonplist.decode_hex("9cc3ee4daaf8cb003902e9"),
      )
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646174613e0a6e4d5075546172347977413541756b3d0a3c2f646174613e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(@moonplist.decode_hex("9cc3ee4daaf8cb003902e9")),
          decoded,
        ),
      )
      println(
        "CASE:63:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Unsigned(13505573367965082028UL)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030140000000000000000bb6d6f6c2d88e1ac080000000000000101000000000000000100000000000000000000000000000019",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Unsigned(13505573367965082028UL),
          decoded,
        ),
      )
      println(
        "CASE:64:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Unsigned(13505573367965082028UL)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c696e74656765723e31333530353537333336373936353038323032383c2f696e74656765723e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Unsigned(13505573367965082028UL),
          decoded,
        ),
      )
      println(
        "CASE:65:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Dict([
        ("k0", @moonplist.Text("汉字🍎 <&>\r\n877")),
        ("k1", @moonplist.Integer(777951058788946698L)),
      ])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030d201020304526b30526b316d6c495b57d83cdf4e0020003c0026003e000d000a003800370037130acbd65dbfc1130a080d10132e0000000000000101000000000000000500000000000000000000000000000037",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Dict([
            ("k0", @moonplist.Text("汉字🍎 <&>\r\n877")),
            ("k1", @moonplist.Integer(777951058788946698L)),
          ]),
          decoded,
        ),
      )
      println(
        "CASE:66:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Dict([
        ("k0", @moonplist.Text("汉字🍎 <&>\r\n877")),
        ("k1", @moonplist.Integer(777951058788946698L)),
      ])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646963743e0a093c6b65793e6b303c2f6b65793e0a093c737472696e673ee6b189e5ad97f09f8d8e20266c743b26616d703b2667743b0a3837373c2f737472696e673e0a093c6b65793e6b313c2f6b65793e0a093c696e74656765723e3737373935313035383738383934363639383c2f696e74656765723e0a3c2f646963743e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Dict([
            ("k0", @moonplist.Text("汉字🍎 <&>\n877")),
            ("k1", @moonplist.Integer(777951058788946698L)),
          ]),
          decoded,
        ),
      )
      println(
        "CASE:67:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Dict([
        ("k0", @moonplist.Boolean(true)),
        ("k1", @moonplist.Boolean(true)),
        ("k2", @moonplist.Integer(6106450926160705903L)),
        (
          "k3",
          @moonplist.Dict([("k0", @moonplist.Text("汉字🍎 <&>\r\n185"))]),
        ),
      ])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030d40102030405050607526b30526b31526b32526b33091354be78c39429f96fd101086d6c495b57d83cdf4e0020003c0026003e000d000a003100380035081114171a1d1e272a0000000000000101000000000000000900000000000000000000000000000045",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Dict([
            ("k0", @moonplist.Boolean(true)),
            ("k1", @moonplist.Boolean(true)),
            ("k2", @moonplist.Integer(6106450926160705903L)),
            (
              "k3",
              @moonplist.Dict([("k0", @moonplist.Text("汉字🍎 <&>\r\n185"))]),
            ),
          ]),
          decoded,
        ),
      )
      println(
        "CASE:68:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Dict([
        ("k0", @moonplist.Boolean(true)),
        ("k1", @moonplist.Boolean(true)),
        ("k2", @moonplist.Integer(6106450926160705903L)),
        (
          "k3",
          @moonplist.Dict([("k0", @moonplist.Text("汉字🍎 <&>\r\n185"))]),
        ),
      ])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646963743e0a093c6b65793e6b303c2f6b65793e0a093c747275652f3e0a093c6b65793e6b313c2f6b65793e0a093c747275652f3e0a093c6b65793e6b323c2f6b65793e0a093c696e74656765723e363130363435303932363136303730353930333c2f696e74656765723e0a093c6b65793e6b333c2f6b65793e0a093c646963743e0a09093c6b65793e6b303c2f6b65793e0a09093c737472696e673ee6b189e5ad97f09f8d8e20266c743b26616d703b2667743b0a3138353c2f737472696e673e0a093c2f646963743e0a3c2f646963743e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Dict([
            ("k0", @moonplist.Boolean(true)),
            ("k1", @moonplist.Boolean(true)),
            ("k2", @moonplist.Integer(6106450926160705903L)),
            (
              "k3",
              @moonplist.Dict([("k0", @moonplist.Text("汉字🍎 <&>\n185"))]),
            ),
          ]),
          decoded,
        ),
      )
      println(
        "CASE:69:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Text("")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303050080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Text(""), decoded))
      println(
        "CASE:70:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Text("")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c737472696e673e3c2f737472696e673e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Text(""), decoded))
      println(
        "CASE:71:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Text("汉字🍎 <&>\r\n835")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c69737430306d6c495b57d83cdf4e0020003c0026003e000d000a003800330035080000000000000101000000000000000100000000000000000000000000000023",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Text("汉字🍎 <&>\r\n835"), decoded),
      )
      println(
        "CASE:72:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Text("汉字🍎 <&>\r\n835")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c737472696e673ee6b189e5ad97f09f8d8e20266c743b26616d703b2667743b0a3833353c2f737472696e673e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Text("汉字🍎 <&>\n835"), decoded),
      )
      println(
        "CASE:73:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Data(@moonplist.decode_hex("f51e"))
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303042f51e08000000000000010100000000000000010000000000000000000000000000000b",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(@moonplist.decode_hex("f51e")),
          decoded,
        ),
      )
      println(
        "CASE:74:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Data(@moonplist.decode_hex("f51e"))
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646174613e0a3952343d0a3c2f646174613e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(@moonplist.decode_hex("f51e")),
          decoded,
        ),
      )
      println(
        "CASE:75:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.List([@moonplist.Text("")])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030a10150080a000000000000010100000000000000020000000000000000000000000000000b",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.List([@moonplist.Text("")]), decoded),
      )
      println(
        "CASE:76:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.List([@moonplist.Text("")])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c61727261793e0a093c737472696e673e3c2f737472696e673e0a3c2f61727261793e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.List([@moonplist.Text("")]), decoded),
      )
      println(
        "CASE:77:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Boolean(false)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303008080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(false), decoded))
      println(
        "CASE:78:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Boolean(false)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c66616c73652f3e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(false), decoded))
      println(
        "CASE:79:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Dict([
        ("k0", @moonplist.Real(-11.041160653545404)),
        ("k1", @moonplist.Boolean(true)),
        ("k2", @moonplist.Text("汉字🍎 <&>\r\n982")),
        ("k3", @moonplist.Boolean(true)),
      ])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030d40102030405060706526b30526b31526b32526b3323c02615130259b810096d6c495b57d83cdf4e0020003c0026003e000d000a003900380032081114171a1d26270000000000000101000000000000000800000000000000000000000000000042",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Dict([
            ("k0", @moonplist.Real(-11.041160653545404)),
            ("k1", @moonplist.Boolean(true)),
            ("k2", @moonplist.Text("汉字🍎 <&>\r\n982")),
            ("k3", @moonplist.Boolean(true)),
          ]),
          decoded,
        ),
      )
      println(
        "CASE:80:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Dict([
        ("k0", @moonplist.Real(-11.041160653545404)),
        ("k1", @moonplist.Boolean(true)),
        ("k2", @moonplist.Text("汉字🍎 <&>\r\n982")),
        ("k3", @moonplist.Boolean(true)),
      ])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646963743e0a093c6b65793e6b303c2f6b65793e0a093c7265616c3e2d31312e3034313136303635333534353430343c2f7265616c3e0a093c6b65793e6b313c2f6b65793e0a093c747275652f3e0a093c6b65793e6b323c2f6b65793e0a093c737472696e673ee6b189e5ad97f09f8d8e20266c743b26616d703b2667743b0a3938323c2f737472696e673e0a093c6b65793e6b333c2f6b65793e0a093c747275652f3e0a3c2f646963743e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Dict([
            ("k0", @moonplist.Real(-11.041160653545404)),
            ("k1", @moonplist.Boolean(true)),
            ("k2", @moonplist.Text("汉字🍎 <&>\n982")),
            ("k3", @moonplist.Boolean(true)),
          ]),
          decoded,
        ),
      )
      println(
        "CASE:81:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Unsigned(15269683119538456004UL)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030140000000000000000d3e8cfe51cde45c4080000000000000101000000000000000100000000000000000000000000000019",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Unsigned(15269683119538456004UL),
          decoded,
        ),
      )
      println(
        "CASE:82:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Unsigned(15269683119538456004UL)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c696e74656765723e31353236393638333131393533383435363030343c2f696e74656765723e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Unsigned(15269683119538456004UL),
          decoded,
        ),
      )
      println(
        "CASE:83:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Date(730902659.0)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c69737430303341c5c85841800000080000000000000101000000000000000100000000000000000000000000000011",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Date(730902659.0), decoded))
      println(
        "CASE:84:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Date(730902659.0)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646174653e323032342d30322d32395431323a33303a35395a3c2f646174653e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Date(730902659.0), decoded))
      println(
        "CASE:85:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Boolean(false)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303008080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(false), decoded))
      println(
        "CASE:86:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Boolean(false)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c66616c73652f3e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(false), decoded))
      println(
        "CASE:87:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Data(@moonplist.decode_hex("03db9d"))
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c69737430304303db9d08000000000000010100000000000000010000000000000000000000000000000c",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(@moonplist.decode_hex("03db9d")),
          decoded,
        ),
      )
      println(
        "CASE:88:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Data(@moonplist.decode_hex("03db9d"))
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646174613e0a413975640a3c2f646174613e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(@moonplist.decode_hex("03db9d")),
          decoded,
        ),
      )
      println(
        "CASE:89:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Integer(-4741521311848184480L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303013be32bb7d10584560080000000000000101000000000000000100000000000000000000000000000011",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Integer(-4741521311848184480L),
          decoded,
        ),
      )
      println(
        "CASE:90:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Integer(-4741521311848184480L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c696e74656765723e2d343734313532313331313834383138343438303c2f696e74656765723e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Integer(-4741521311848184480L),
          decoded,
        ),
      )
      println(
        "CASE:91:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.List([
        @moonplist.Text(""),
        @moonplist.Dict([
          (
            "k0",
            @moonplist.List([
              @moonplist.Real(-3.521387466244377),
              @moonplist.Boolean(true),
            ]),
          ),
        ]),
        @moonplist.Data(@moonplist.decode_hex("ee5541e6f13083be463d96993f46")),
      ])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030a301020750d10304526b30a2050623c00c2bcd312082e0094eee5541e6f13083be463d96993f46080c0d1013161f20000000000000010100000000000000080000000000000000000000000000002f",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.List([
            @moonplist.Text(""),
            @moonplist.Dict([
              (
                "k0",
                @moonplist.List([
                  @moonplist.Real(-3.521387466244377),
                  @moonplist.Boolean(true),
                ]),
              ),
            ]),
            @moonplist.Data(
              @moonplist.decode_hex("ee5541e6f13083be463d96993f46"),
            ),
          ]),
          decoded,
        ),
      )
      println(
        "CASE:92:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.List([
        @moonplist.Text(""),
        @moonplist.Dict([
          (
            "k0",
            @moonplist.List([
              @moonplist.Real(-3.521387466244377),
              @moonplist.Boolean(true),
            ]),
          ),
        ]),
        @moonplist.Data(@moonplist.decode_hex("ee5541e6f13083be463d96993f46")),
      ])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c61727261793e0a093c737472696e673e3c2f737472696e673e0a093c646963743e0a09093c6b65793e6b303c2f6b65793e0a09093c61727261793e0a0909093c7265616c3e2d332e3532313338373436363234343337373c2f7265616c3e0a0909093c747275652f3e0a09093c2f61727261793e0a093c2f646963743e0a093c646174613e0a09376c56423576457767373547505a615a5030593d0a093c2f646174613e0a3c2f61727261793e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.List([
            @moonplist.Text(""),
            @moonplist.Dict([
              (
                "k0",
                @moonplist.List([
                  @moonplist.Real(-3.521387466244377),
                  @moonplist.Boolean(true),
                ]),
              ),
            ]),
            @moonplist.Data(
              @moonplist.decode_hex("ee5541e6f13083be463d96993f46"),
            ),
          ]),
          decoded,
        ),
      )
      println(
        "CASE:93:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Dict([])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030d0080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Dict([]), decoded))
      println(
        "CASE:94:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Dict([])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646963742f3e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Dict([]), decoded))
      println(
        "CASE:95:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Integer(4560063177038522968L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030133f48994c9cb86a58080000000000000101000000000000000100000000000000000000000000000011",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Integer(4560063177038522968L), decoded),
      )
      println(
        "CASE:96:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Integer(4560063177038522968L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c696e74656765723e343536303036333137373033383532323936383c2f696e74656765723e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Integer(4560063177038522968L), decoded),
      )
      println(
        "CASE:97:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Date(730902659.0)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c69737430303341c5c85841800000080000000000000101000000000000000100000000000000000000000000000011",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Date(730902659.0), decoded))
      println(
        "CASE:98:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Date(730902659.0)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646174653e323032342d30322d32395431323a33303a35395a3c2f646174653e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Date(730902659.0), decoded))
      println(
        "CASE:99:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Real(-3.3137577328854917)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303023c00a82936a0ce1e0080000000000000101000000000000000100000000000000000000000000000011",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Real(-3.3137577328854917), decoded),
      )
      println(
        "CASE:100:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Real(-3.3137577328854917)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c7265616c3e2d332e333133373537373332383835343931373c2f7265616c3e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Real(-3.3137577328854917), decoded),
      )
      println(
        "CASE:101:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Boolean(false)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303008080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(false), decoded))
      println(
        "CASE:102:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Boolean(false)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c66616c73652f3e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(false), decoded))
      println(
        "CASE:103:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Date(730902659.0)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c69737430303341c5c85841800000080000000000000101000000000000000100000000000000000000000000000011",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Date(730902659.0), decoded))
      println(
        "CASE:104:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Date(730902659.0)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646174653e323032342d30322d32395431323a33303a35395a3c2f646174653e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Date(730902659.0), decoded))
      println(
        "CASE:105:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Text("")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303050080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Text(""), decoded))
      println(
        "CASE:106:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Text("")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c737472696e673e3c2f737472696e673e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Text(""), decoded))
      println(
        "CASE:107:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Unsigned(10572574493135735143UL)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303014000000000000000092b9547c50b60967080000000000000101000000000000000100000000000000000000000000000019",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Unsigned(10572574493135735143UL),
          decoded,
        ),
      )
      println(
        "CASE:108:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Unsigned(10572574493135735143UL)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c696e74656765723e31303537323537343439333133353733353134333c2f696e74656765723e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Unsigned(10572574493135735143UL),
          decoded,
        ),
      )
      println(
        "CASE:109:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Boolean(true)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303009080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(true), decoded))
      println(
        "CASE:110:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Boolean(true)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c747275652f3e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(true), decoded))
      println(
        "CASE:111:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Unsigned(10537155931662961416UL)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030140000000000000000923b7f7dd9abcb08080000000000000101000000000000000100000000000000000000000000000019",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Unsigned(10537155931662961416UL),
          decoded,
        ),
      )
      println(
        "CASE:112:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Unsigned(10537155931662961416UL)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c696e74656765723e31303533373135353933313636323936313431363c2f696e74656765723e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Unsigned(10537155931662961416UL),
          decoded,
        ),
      )
      println(
        "CASE:113:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.List([
        @moonplist.Text(""),
        @moonplist.Data(
          @moonplist.decode_hex("e0adeaf064621e2c34c3347f27bc5dc978cd45"),
        ),
      ])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030a20102504f1013e0adeaf064621e2c34c3347f27bc5dc978cd45080b0c0000000000000101000000000000000300000000000000000000000000000022",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.List([
            @moonplist.Text(""),
            @moonplist.Data(
              @moonplist.decode_hex("e0adeaf064621e2c34c3347f27bc5dc978cd45"),
            ),
          ]),
          decoded,
        ),
      )
      println(
        "CASE:114:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.List([
        @moonplist.Text(""),
        @moonplist.Data(
          @moonplist.decode_hex("e0adeaf064621e2c34c3347f27bc5dc978cd45"),
        ),
      ])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c61727261793e0a093c737472696e673e3c2f737472696e673e0a093c646174613e0a09344b33713847526948697730777a522f4a37786479586a4e52513d3d0a093c2f646174613e0a3c2f61727261793e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.List([
            @moonplist.Text(""),
            @moonplist.Data(
              @moonplist.decode_hex("e0adeaf064621e2c34c3347f27bc5dc978cd45"),
            ),
          ]),
          decoded,
        ),
      )
      println(
        "CASE:115:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Integer(2773354920504740130L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303013267cef9b38c44922080000000000000101000000000000000100000000000000000000000000000011",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Integer(2773354920504740130L), decoded),
      )
      println(
        "CASE:116:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Integer(2773354920504740130L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c696e74656765723e323737333335343932303530343734303133303c2f696e74656765723e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Integer(2773354920504740130L), decoded),
      )
      println(
        "CASE:117:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Text("")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303050080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Text(""), decoded))
      println(
        "CASE:118:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Text("")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c737472696e673e3c2f737472696e673e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Text(""), decoded))
      println(
        "CASE:119:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Data(
        @moonplist.decode_hex("d34a2f7712f1c0a0cb95"),
      )
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c69737430304ad34a2f7712f1c0a0cb95080000000000000101000000000000000100000000000000000000000000000013",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(@moonplist.decode_hex("d34a2f7712f1c0a0cb95")),
          decoded,
        ),
      )
      println(
        "CASE:120:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Data(
        @moonplist.decode_hex("d34a2f7712f1c0a0cb95"),
      )
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646174613e0a30306f7664784c78774b444c6c513d3d0a3c2f646174613e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(@moonplist.decode_hex("d34a2f7712f1c0a0cb95")),
          decoded,
        ),
      )
      println(
        "CASE:121:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.List([
        @moonplist.Integer(4388525097002646115L),
        @moonplist.Date(730902659.0),
        @moonplist.Text(""),
      ])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030a3010203133ce72c5306baba633341c5c8584180000050080c151e000000000000010100000000000000040000000000000000000000000000001f",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.List([
            @moonplist.Integer(4388525097002646115L),
            @moonplist.Date(730902659.0),
            @moonplist.Text(""),
          ]),
          decoded,
        ),
      )
      println(
        "CASE:122:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.List([
        @moonplist.Integer(4388525097002646115L),
        @moonplist.Date(730902659.0),
        @moonplist.Text(""),
      ])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c61727261793e0a093c696e74656765723e343338383532353039373030323634363131353c2f696e74656765723e0a093c646174653e323032342d30322d32395431323a33303a35395a3c2f646174653e0a093c737472696e673e3c2f737472696e673e0a3c2f61727261793e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.List([
            @moonplist.Integer(4388525097002646115L),
            @moonplist.Date(730902659.0),
            @moonplist.Text(""),
          ]),
          decoded,
        ),
      )
      println(
        "CASE:123:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Text("")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303050080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Text(""), decoded))
      println(
        "CASE:124:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Text("")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c737472696e673e3c2f737472696e673e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Text(""), decoded))
      println(
        "CASE:125:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Integer(4055941353895748089L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030133849992c0cc5e1f9080000000000000101000000000000000100000000000000000000000000000011",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Integer(4055941353895748089L), decoded),
      )
      println(
        "CASE:126:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Integer(4055941353895748089L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c696e74656765723e343035353934313335333839353734383038393c2f696e74656765723e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Integer(4055941353895748089L), decoded),
      )
      println(
        "CASE:127:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Unsigned(14519882490246108264UL)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030140000000000000000c980fc31fb889468080000000000000101000000000000000100000000000000000000000000000019",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Unsigned(14519882490246108264UL),
          decoded,
        ),
      )
      println(
        "CASE:128:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Unsigned(14519882490246108264UL)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c696e74656765723e31343531393838323439303234363130383236343c2f696e74656765723e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Unsigned(14519882490246108264UL),
          decoded,
        ),
      )
      println(
        "CASE:129:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Unsigned(12869819155332000549UL)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030140000000000000000b29ac855a514eb25080000000000000101000000000000000100000000000000000000000000000019",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Unsigned(12869819155332000549UL),
          decoded,
        ),
      )
      println(
        "CASE:130:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Unsigned(12869819155332000549UL)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c696e74656765723e31323836393831393135353333323030303534393c2f696e74656765723e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Unsigned(12869819155332000549UL),
          decoded,
        ),
      )
      println(
        "CASE:131:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.List([@moonplist.Text("汉字🍎 <&>\r\n815")])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030a1016d6c495b57d83cdf4e0020003c0026003e000d000a003800310035080a0000000000000101000000000000000200000000000000000000000000000025",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.List([@moonplist.Text("汉字🍎 <&>\r\n815")]),
          decoded,
        ),
      )
      println(
        "CASE:132:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.List([@moonplist.Text("汉字🍎 <&>\r\n815")])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c61727261793e0a093c737472696e673ee6b189e5ad97f09f8d8e20266c743b26616d703b2667743b0a3831353c2f737472696e673e0a3c2f61727261793e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.List([@moonplist.Text("汉字🍎 <&>\n815")]),
          decoded,
        ),
      )
      println(
        "CASE:133:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Boolean(false)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303008080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(false), decoded))
      println(
        "CASE:134:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Boolean(false)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c66616c73652f3e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(false), decoded))
      println(
        "CASE:135:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Boolean(true)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303009080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(true), decoded))
      println(
        "CASE:136:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Boolean(true)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c747275652f3e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(true), decoded))
      println(
        "CASE:137:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Unsigned(15783023904341559333UL)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030140000000000000000db08909e73c70825080000000000000101000000000000000100000000000000000000000000000019",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Unsigned(15783023904341559333UL),
          decoded,
        ),
      )
      println(
        "CASE:138:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Unsigned(15783023904341559333UL)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c696e74656765723e31353738333032333930343334313535393333333c2f696e74656765723e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Unsigned(15783023904341559333UL),
          decoded,
        ),
      )
      println(
        "CASE:139:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.List([
        @moonplist.Data(
          @moonplist.decode_hex(
            "095392a541df1a8517e81b528ee692b061c35c8dad32f39b",
          ),
        ),
        @moonplist.Boolean(true),
        @moonplist.Data(@moonplist.decode_hex("3fb52add56413113c1bd990f5321")),
        @moonplist.Unsigned(11534854049479378481UL),
      ])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030a4010203044f1018095392a541df1a8517e81b528ee692b061c35c8dad32f39b094e3fb52add56413113c1bd990f5321140000000000000000a01408a4cb31c631080d2829380000000000000101000000000000000500000000000000000000000000000049",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.List([
            @moonplist.Data(
              @moonplist.decode_hex(
                "095392a541df1a8517e81b528ee692b061c35c8dad32f39b",
              ),
            ),
            @moonplist.Boolean(true),
            @moonplist.Data(
              @moonplist.decode_hex("3fb52add56413113c1bd990f5321"),
            ),
            @moonplist.Unsigned(11534854049479378481UL),
          ]),
          decoded,
        ),
      )
      println(
        "CASE:140:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.List([
        @moonplist.Data(
          @moonplist.decode_hex(
            "095392a541df1a8517e81b528ee692b061c35c8dad32f39b",
          ),
        ),
        @moonplist.Boolean(true),
        @moonplist.Data(@moonplist.decode_hex("3fb52add56413113c1bd990f5321")),
        @moonplist.Unsigned(11534854049479378481UL),
      ])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c61727261793e0a093c646174613e0a0943564f5370554866476f5558364274536a75615373474844584932744d764f620a093c2f646174613e0a093c747275652f3e0a093c646174613e0a095037557133565a424d525042765a6b505579453d0a093c2f646174613e0a093c696e74656765723e31313533343835343034393437393337383438313c2f696e74656765723e0a3c2f61727261793e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.List([
            @moonplist.Data(
              @moonplist.decode_hex(
                "095392a541df1a8517e81b528ee692b061c35c8dad32f39b",
              ),
            ),
            @moonplist.Boolean(true),
            @moonplist.Data(
              @moonplist.decode_hex("3fb52add56413113c1bd990f5321"),
            ),
            @moonplist.Unsigned(11534854049479378481UL),
          ]),
          decoded,
        ),
      )
      println(
        "CASE:141:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Boolean(true)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303009080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(true), decoded))
      println(
        "CASE:142:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Boolean(true)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c747275652f3e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(true), decoded))
      println(
        "CASE:143:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Boolean(true)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303009080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(true), decoded))
      println(
        "CASE:144:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Boolean(true)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c747275652f3e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(true), decoded))
      println(
        "CASE:145:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Data(@moonplist.decode_hex("4dde4eb4bad7"))
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030464dde4eb4bad708000000000000010100000000000000010000000000000000000000000000000f",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(@moonplist.decode_hex("4dde4eb4bad7")),
          decoded,
        ),
      )
      println(
        "CASE:146:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Data(@moonplist.decode_hex("4dde4eb4bad7"))
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646174613e0a5464354f744c72580a3c2f646174613e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(@moonplist.decode_hex("4dde4eb4bad7")),
          decoded,
        ),
      )
      println(
        "CASE:147:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.List([
        @moonplist.Date(730902659.0),
        @moonplist.Text("汉字🍎 <&>\r\n644"),
      ])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030a201023341c5c858418000006d6c495b57d83cdf4e0020003c0026003e000d000a003600340034080b14000000000000010100000000000000030000000000000000000000000000002f",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.List([
            @moonplist.Date(730902659.0),
            @moonplist.Text("汉字🍎 <&>\r\n644"),
          ]),
          decoded,
        ),
      )
      println(
        "CASE:148:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.List([
        @moonplist.Date(730902659.0),
        @moonplist.Text("汉字🍎 <&>\r\n644"),
      ])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c61727261793e0a093c646174653e323032342d30322d32395431323a33303a35395a3c2f646174653e0a093c737472696e673ee6b189e5ad97f09f8d8e20266c743b26616d703b2667743b0a3634343c2f737472696e673e0a3c2f61727261793e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.List([
            @moonplist.Date(730902659.0),
            @moonplist.Text("汉字🍎 <&>\n644"),
          ]),
          decoded,
        ),
      )
      println(
        "CASE:149:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Boolean(true)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303009080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(true), decoded))
      println(
        "CASE:150:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Boolean(true)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c747275652f3e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(true), decoded))
      println(
        "CASE:151:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Integer(6374617967382212429L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030135877314464a3af4d080000000000000101000000000000000100000000000000000000000000000011",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Integer(6374617967382212429L), decoded),
      )
      println(
        "CASE:152:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Integer(6374617967382212429L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c696e74656765723e363337343631373936373338323231323432393c2f696e74656765723e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Integer(6374617967382212429L), decoded),
      )
      println(
        "CASE:153:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Text("")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303050080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Text(""), decoded))
      println(
        "CASE:154:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Text("")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c737472696e673e3c2f737472696e673e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Text(""), decoded))
      println(
        "CASE:155:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Unsigned(14558368067548461062UL)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030140000000000000000ca09b69fb79db806080000000000000101000000000000000100000000000000000000000000000019",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Unsigned(14558368067548461062UL),
          decoded,
        ),
      )
      println(
        "CASE:156:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Unsigned(14558368067548461062UL)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c696e74656765723e31343535383336383036373534383436313036323c2f696e74656765723e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Unsigned(14558368067548461062UL),
          decoded,
        ),
      )
      println(
        "CASE:157:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Integer(-5084457988873012042L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303013b9706065d1d3bcb6080000000000000101000000000000000100000000000000000000000000000011",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Integer(-5084457988873012042L),
          decoded,
        ),
      )
      println(
        "CASE:158:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Integer(-5084457988873012042L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c696e74656765723e2d353038343435373938383837333031323034323c2f696e74656765723e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Integer(-5084457988873012042L),
          decoded,
        ),
      )
      println(
        "CASE:159:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Boolean(true)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303009080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(true), decoded))
      println(
        "CASE:160:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Boolean(true)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c747275652f3e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Boolean(true), decoded))
      println(
        "CASE:161:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Integer(3833513908315154020L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c69737430301335336096baa4e664080000000000000101000000000000000100000000000000000000000000000011",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Integer(3833513908315154020L), decoded),
      )
      println(
        "CASE:162:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Integer(3833513908315154020L)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c696e74656765723e333833333531333930383331353135343032303c2f696e74656765723e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Integer(3833513908315154020L), decoded),
      )
      println(
        "CASE:163:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Date(730902659.0)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c69737430303341c5c85841800000080000000000000101000000000000000100000000000000000000000000000011",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Date(730902659.0), decoded))
      println(
        "CASE:164:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Date(730902659.0)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646174653e323032342d30322d32395431323a33303a35395a3c2f646174653e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Date(730902659.0), decoded))
      println(
        "CASE:165:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Data(
        @moonplist.decode_hex("4c5934083b1a17fb40a5f636b73f0cc50760"),
      )
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c69737430304f10124c5934083b1a17fb40a5f636b73f0cc5076008000000000000010100000000000000010000000000000000000000000000001d",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(
            @moonplist.decode_hex("4c5934083b1a17fb40a5f636b73f0cc50760"),
          ),
          decoded,
        ),
      )
      println(
        "CASE:166:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Data(
        @moonplist.decode_hex("4c5934083b1a17fb40a5f636b73f0cc50760"),
      )
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646174613e0a54466b3043447361462f744170665932747a384d785164670a3c2f646174613e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(
            @moonplist.decode_hex("4c5934083b1a17fb40a5f636b73f0cc50760"),
          ),
          decoded,
        ),
      )
      println(
        "CASE:167:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Data(@moonplist.decode_hex("8491541542"))
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303045849154154208000000000000010100000000000000010000000000000000000000000000000e",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(@moonplist.decode_hex("8491541542")),
          decoded,
        ),
      )
      println(
        "CASE:168:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Data(@moonplist.decode_hex("8491541542"))
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646174613e0a684a46554655493d0a3c2f646174613e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(@moonplist.decode_hex("8491541542")),
          decoded,
        ),
      )
      println(
        "CASE:169:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Data(
        @moonplist.decode_hex(
          "68fc3fe0c7cb46a5885759b64e0788ae8009352223252526a7d33ba61c",
        ),
      )
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c69737430304f101d68fc3fe0c7cb46a5885759b64e0788ae8009352223252526a7d33ba61c080000000000000101000000000000000100000000000000000000000000000028",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(
            @moonplist.decode_hex(
              "68fc3fe0c7cb46a5885759b64e0788ae8009352223252526a7d33ba61c",
            ),
          ),
          decoded,
        ),
      )
      println(
        "CASE:170:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Data(
        @moonplist.decode_hex(
          "68fc3fe0c7cb46a5885759b64e0788ae8009352223252526a7d33ba61c",
        ),
      )
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646174613e0a6150772f344d664c5271574956316d3254676549726f414a4e53496a4a53556d70394d377068773d0a3c2f646174613e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(
            @moonplist.decode_hex(
              "68fc3fe0c7cb46a5885759b64e0788ae8009352223252526a7d33ba61c",
            ),
          ),
          decoded,
        ),
      )
      println(
        "CASE:171:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Text("汉字🍎 <&>\r\n874")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c69737430306d6c495b57d83cdf4e0020003c0026003e000d000a003800370034080000000000000101000000000000000100000000000000000000000000000023",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Text("汉字🍎 <&>\r\n874"), decoded),
      )
      println(
        "CASE:172:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Text("汉字🍎 <&>\r\n874")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c737472696e673ee6b189e5ad97f09f8d8e20266c743b26616d703b2667743b0a3837343c2f737472696e673e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Text("汉字🍎 <&>\n874"), decoded),
      )
      println(
        "CASE:173:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Data(@moonplist.decode_hex("dcb8"))
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303042dcb808000000000000010100000000000000010000000000000000000000000000000b",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(@moonplist.decode_hex("dcb8")),
          decoded,
        ),
      )
      println(
        "CASE:174:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Data(@moonplist.decode_hex("dcb8"))
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646174613e0a334c673d0a3c2f646174613e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(@moonplist.decode_hex("dcb8")),
          decoded,
        ),
      )
      println(
        "CASE:175:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.List([])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030a0080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.List([]), decoded))
      println(
        "CASE:176:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.List([])
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c61727261792f3e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.List([]), decoded))
      println(
        "CASE:177:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Real(-4.852808424932157)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303023c01369469c9b58f8080000000000000101000000000000000100000000000000000000000000000011",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Real(-4.852808424932157), decoded),
      )
      println(
        "CASE:178:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Real(-4.852808424932157)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c7265616c3e2d342e3835323830383432343933323135373c2f7265616c3e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Real(-4.852808424932157), decoded),
      )
      println(
        "CASE:179:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Data(
        @moonplist.decode_hex("f3034645e5e6a3b7fb843af87ab345"),
      )
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c69737430304f100ff3034645e5e6a3b7fb843af87ab34508000000000000010100000000000000010000000000000000000000000000001a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(
            @moonplist.decode_hex("f3034645e5e6a3b7fb843af87ab345"),
          ),
          decoded,
        ),
      )
      println(
        "CASE:180:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Data(
        @moonplist.decode_hex("f3034645e5e6a3b7fb843af87ab345"),
      )
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c646174613e0a38774e475265586d6f3766376844723465724e460a3c2f646174613e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(
        @moonplist.equivalent(
          @moonplist.Data(
            @moonplist.decode_hex("f3034645e5e6a3b7fb843af87ab345"),
          ),
          decoded,
        ),
      )
      println(
        "CASE:181:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Text("")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303050080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Text(""), decoded))
      println(
        "CASE:182:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Text("")
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "3c3f786d6c2076657273696f6e3d22312e302220656e636f64696e673d225554462d38223f3e0a3c21444f435459504520706c697374205055424c494320222d2f2f4170706c652f2f44544420504c49535420312e302f2f454e222022687474703a2f2f7777772e6170706c652e636f6d2f445444732f50726f70657274794c6973742d312e302e647464223e0a3c706c6973742076657273696f6e3d22312e30223e0a3c737472696e673e3c2f737472696e673e0a3c2f706c6973743e0a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Text(""), decoded))
      println(
        "CASE:183:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Xml)),
      )
    }
    {
      let expected = @moonplist.Null
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303000080000000000000101000000000000000100000000000000000000000000000009",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Null, decoded))
      println(
        "CASE:184:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Uid(0UL)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c6973743030800008000000000000010100000000000000010000000000000000000000000000000a",
        ),
      )
      assert_true(@moonplist.equivalent(@moonplist.Uid(0UL), decoded))
      println(
        "CASE:185:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    {
      let expected = @moonplist.Uid(18446744073709551615UL)
      let decoded = @moonplist.decode(
        @moonplist.decode_hex(
          "62706c697374303087ffffffffffffffff080000000000000101000000000000000100000000000000000000000000000011",
        ),
      )
      assert_true(
        @moonplist.equivalent(@moonplist.Uid(18446744073709551615UL), decoded),
      )
      println(
        "CASE:186:" +
        @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
      )
    }
    let expected = @moonplist.Date(0.5)
    let decoded = @moonplist.decode(
      @moonplist.decode_hex(
        "62706c6973743030333fe0000000000000080000000000000101000000000000000100000000000000000000000000000011",
      ),
    )
    assert_true(@moonplist.equivalent(@moonplist.Date(0.5), decoded))
    println(
      "CASE:187:" +
      @moonplist.encode_hex(@moonplist.encode(expected, @moonplist.Binary)),
    )
  } catch {
    _ => abort("interop assertion or codec failure")
  }
}
