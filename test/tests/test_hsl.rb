require 'test/unit'

require 'redgreenblue'

class Test_hsl < Test::Unit::TestCase

  def test_lightness
    [
    ['#FFFFFF', 1.0  ],
    ['#808080', 0.502],
    ['#000000', 0.0  ],
    ['#FF0000', 0.5  ],
    ].each do |hx,l|
      assert_equal l, RGB.hex(hx).lightness.round(3)
    end
  end

  def test_hue
    assert_nil RGB.white.hue
    assert_nil RGB.grey.hue
    assert_nil RGB.black.hue
    [
    ['#FF0000', 0.0],
    ['#00FF00', 120.0],
    ['#0000FF', 240.0]
    ].each do |hx,h|
      assert_equal h, RGB.hex(hx).hue
    end
  end

end