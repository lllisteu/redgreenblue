require 'test/unit'

require 'redgreenblue'

class Test_gpl < Test::Unit::TestCase

  def test_to_gpl
    assert_equal '  0   0   0', RGB.rgb(0, 0, 0).gpl
    assert_equal "128   0 255\t", RGB.rgb(128, 0, 255).gpl('')
    assert_equal "138 153 119\tBlassgrün", RGB.rgb(138, 153, 119).gpl('Blassgrün')
    assert_equal "  0 170   0\t2", RGB.rgb(0, 170, 0).gpl(2)

    c = RGB.rgb(255, 128, 0)
    c.name = 'Aurantius'
    assert_equal "255 128   0\tAurantius", c.gpl
    assert_equal "255 128   0\tOrange", c.gpl('Orange')
    c.name = nil
    assert_equal "255 128   0", c.gpl
  end

end
