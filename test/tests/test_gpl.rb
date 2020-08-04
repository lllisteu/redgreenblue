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

end
