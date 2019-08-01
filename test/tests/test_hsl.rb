require 'test/unit'

require 'redgreenblue'

class Test_hsl < Test::Unit::TestCase

  def test_lightness
    [
    ['#FFFFFF', 1.0  ],
    ['#808080', 0.502],
    ['#000000', 0.0  ],
    ['#FF0000', 0.5  ],
    ].each do |h,l|
      assert_equal l, RGB.hex(h).lightness.round(3)
    end
  end

end