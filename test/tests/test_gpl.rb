require 'test/unit'

require 'redgreenblue'

class Test_gpl < Test::Unit::TestCase

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

    assert_equal RGB.hex('f9c'), RGB.gpl("255 153 204")
    assert_equal RGB.hex('f9c'), RGB.gpl("255 153 204\n")
    assert_equal RGB.hex('f9c'), RGB.gpl("255 153 204\t")
    assert_equal RGB.hex('f9c'), RGB.gpl("255 153 204\t\n")
    assert_equal RGB.hex('f9c'), RGB.gpl("255 153 204\tpink")
    assert_equal RGB.hex('f9c'), RGB.gpl("255 153 204\tpink\n")

    assert_equal RGB.black, RGB.gpl('0 0 0')
    assert_equal RGB.white, RGB.gpl('255 255 255')
    assert_equal RGB.white, RGB.gpl("255 255 255\n")
    assert_equal RGB.white, RGB.gpl("255\t255\t255")

    assert_equal RGB.rgb(  0,   0,   0), RGB.gpl('  0   0   0')
    assert_equal RGB.rgb(128,   0, 255), RGB.gpl("128   0 255\t")
    assert_equal RGB.rgb(138, 153, 119), RGB.gpl("138 153 119\tBlassgrün")
    assert_equal RGB.rgb(  0, 170,   0), RGB.gpl("  0 170   0\t2")

    assert_nil RGB.gpl("255 153 204").name
    assert_nil RGB.gpl("255 153 204\n").name
    assert_nil RGB.gpl("255 153 204\t").name
    assert_nil RGB.gpl("255 153 204\t\n").name

    assert_equal 'pink', RGB.gpl("255 153 204\tpink").name
    assert_equal 'pink', RGB.gpl("255 153 204\tpink\n").name
    assert_equal 'オレンジ色', RGB.gpl("243 152 0\tオレンジ色").name
  end

end
