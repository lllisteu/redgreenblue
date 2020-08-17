require 'test/unit'

require 'redgreenblue'

class Test_gpl < Test::Unit::TestCase

  def _gpl_string
    <<~TS
      Gimp Palette
      Name: CSS basic color keywords
      Columns: 12
      # 0 255 128

      \tpink

      0 0 0
        0   0   0
      255 255 255
      255\t255\t255

      255 153 204
      255 153 204\t
      255 153 204\tpink
      255 153 204 pink
      243 152 0\tオレンジ色
      138 153 119\tBlassgrün

      # numeric name
        0 170   0\t2
    TS
  end

  def test_to_gpl
    assert_equal '  0   0   0', RGB.rgb(0, 0, 0).gpl
    assert_equal "138 153 119\tBlassgrün", RGB.rgb(138, 153, 119).gpl('Blassgrün')
    assert_equal "  0 170   0\t2", RGB.rgb(0, 170, 0).gpl(2)

    c = RGB.hex 'f9c'
    assert_equal '255 153 204', c.gpl
    assert_equal '255 153 204', c.gpl(nil)
    assert_equal '255 153 204', c.gpl('')
    assert_equal "255 153 204\tpink", c.gpl('pink')

    c.name = 'ピンク'
    assert_equal "255 153 204\tピンク", c.gpl
    assert_equal '255 153 204', c.gpl(nil)
    assert_equal '255 153 204', c.gpl('')
    assert_equal "255 153 204\tpink", c.gpl('pink')
  end

  def test_from_gpl
    assert_nil RGB.gpl "Gimp Palette"
    assert_nil RGB.gpl "Name: CSS basic color keywords"
    assert_nil RGB.gpl "Columns: 12"
    assert_nil RGB.gpl "# 0 255 128"
    assert_nil RGB.gpl ''
    assert_nil RGB.gpl "\tpink"
    assert_nil RGB.gpl "\n"
    assert_nil RGB.gpl "\r"

    assert_equal RGB.hex('f9c'), RGB.gpl("255 153 204")
    assert_equal RGB.hex('f9c'), RGB.gpl("255 153 204\n")
    assert_equal RGB.hex('f9c'), RGB.gpl("255 153 204\t")
    assert_equal RGB.hex('f9c'), RGB.gpl("255 153 204\t\n")
    assert_equal RGB.hex('f9c'), RGB.gpl("255 153 204\tpink")
    assert_equal RGB.hex('f9c'), RGB.gpl("255 153 204\tpink\n")
    assert_equal RGB.hex('f9c'), RGB.gpl("255\t153\t204\tpink\r\n")

    assert_equal RGB.rgb(138, 153, 119), RGB.gpl("138 153 119\tBlassgrün")
    assert_equal RGB.rgb(  0, 170,   0), RGB.gpl("  0 170   0\t2")

    assert_nil RGB.gpl("255 153 204").name
    assert_nil RGB.gpl("255 153 204\n").name
    assert_nil RGB.gpl("255 153 204\t").name
    assert_nil RGB.gpl("255 153 204\t\n").name

    assert_equal 'pink', RGB.gpl("255 153 204\tpink").name
    assert_equal 'pink', RGB.gpl("255 153 204\tpink\n").name
    assert_equal 'pink', RGB.gpl("255\t153\t204\tpink\r\n").name
    assert_equal 'オレンジ色', RGB.gpl("243 152 0\tオレンジ色").name
  end

  def test_parse_gpl_values
    assert_equal [
      RGB.black,
      RGB.black,
      RGB.white,
      RGB.white,
      RGB.hex('f9c'),
      RGB.hex('f9c'),
      RGB.hex('f9c'),
      RGB.hex('f9c'),
      RGB.rgb(243, 152, 0),
      RGB.rgb(138, 153, 119),
      RGB.rgb(0, 170, 0)
    ], RGB.parse_gpl(_gpl_string)
  end

  def test_parse_gpl_names
    assert_equal [
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      'pink',
      'pink',
      'オレンジ色',
      'Blassgrün',
      '2'
    ], RGB.parse_gpl(_gpl_string).map(&:name)
  end

  def test_parse_gpl_compact
    assert_equal 11, RGB.parse_gpl(_gpl_string).size
    assert_equal 11, RGB.parse_gpl(_gpl_string, compact: true ).size
    assert_equal 21, RGB.parse_gpl(_gpl_string, compact: false).size
  end

  def test_parse_gpl_freeze
    assert_false RGB.parse_gpl(_gpl_string).frozen?
    assert_false RGB.parse_gpl(_gpl_string).first.frozen?

    assert_false RGB.parse_gpl(_gpl_string, freeze: false).frozen?
    assert_false RGB.parse_gpl(_gpl_string, freeze: false).first.frozen?

    assert_true  RGB.parse_gpl(_gpl_string, freeze: true ).frozen?
    assert_true  RGB.parse_gpl(_gpl_string, freeze: true ).first.frozen?
  end

end
