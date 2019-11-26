require 'test/unit'

require 'redgreenblue'

class Test_misc < Test::Unit::TestCase

  def test_invert
    color = RGB.new([0, 0.5, 1])
    assert_equal [1, 0.5, 0]  , color.invert.values

    assert_equal color.rgb   , color.invert.invert.rgb
    assert_equal color.rrggbb, color.invert.invert.rrggbb
    assert_equal color.hex   , color.invert.invert.hex

    assert_equal color.rgb   , color.invert!.invert!.rgb
    assert_equal color.rrggbb, color.invert!.invert!.rrggbb
    assert_equal color.hex   , color.invert!.invert!.hex
  end

end
