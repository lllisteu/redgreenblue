require 'test/unit'

require 'redgreenblue'

class Test_ostwald < Test::Unit::TestCase

  def test_color
    assert_equal RGB.red, RGB.red.whiten.ostwald_color
    assert_equal RGB.red, RGB.red.blacken.ostwald_color
    assert_equal RGB.new(1, 0, 0.5), RGB.new(1, 0.6, 0.8).ostwald_color

    assert_nil RGB.white.ostwald_color
    assert_nil RGB.grey.ostwald_color
    assert_nil RGB.black.ostwald_color
  end

  def test_get_cwk
    assert_equal [1, 0  , 0  ], RGB.red.ostwald_cwk

    assert_equal [0, 1  , 0  ], RGB.white.ostwald_cwk
    assert_equal [0, 0.5, 0.5], RGB.grey.ostwald_cwk
    assert_equal [0, 0  , 1  ], RGB.black.ostwald_cwk
  end

  # From: Color for the Sciences, pp. 575–576
  def test_koenderink
    c = RGB.new(0.8, 0.6, 0.3)
    assert_equal RGB.new(1, 0.6, 0), c.ostwald_color
    assert_equal [0.5, 0.3, 0.2], c.ostwald_cwk
  end
end
