require 'test/unit'

require 'redgreenblue'

class Test_misc < Test::Unit::TestCase

  def test_mix
    assert_equal [128, 128, 128], RGB.white.mix(RGB.black   ).rgb
    assert_equal RGB.white.rgb,   RGB.white.mix(RGB.black, 0).rgb
    assert_equal RGB.black.rgb,   RGB.white.mix(RGB.black, 1).rgb
  end

  def test_invert!
    color = RGB.new([0, 0.5, 1])
    assert_equal 1  , color.invert.red
    assert_equal 0.5, color.invert.green
    assert_equal 0  , color.invert.blue

    assert_equal color.rgb   , color.invert.invert.rgb
    assert_equal color.rrggbb, color.invert.invert.rrggbb
    assert_equal color.hex   , color.invert.invert.hex

    assert_equal color.rgb   , color.invert!.invert!.rgb
    assert_equal color.rrggbb, color.invert!.invert!.rrggbb
    assert_equal color.hex   , color.invert!.invert!.hex
  end
end
