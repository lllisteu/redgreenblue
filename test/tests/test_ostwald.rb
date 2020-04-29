require 'test/unit'

require 'redgreenblue'

class Test_ostwald < Test::Unit::TestCase

  def test_color
    assert_equal RGB.red, RGB.red.whiten.ostwald_color
    assert_equal RGB.red, RGB.red.blacken.ostwald_color
    assert_equal RGB.new(1, 0, 0.5), RGB.new(1, 0.6, 0.8).ostwald_color

    assert_nil RGB.white.ostwald_color
    assert_nil RGB.grey.ostwald_color
  end

end
