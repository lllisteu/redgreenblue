require 'test/unit'

require 'redgreenblue'

class Test_misc < Test::Unit::TestCase

  def test_mix
    assert_equal [128, 128, 128], RGB.white.mix(RGB.black   ).rgb
    assert_equal RGB.white.rgb,   RGB.white.mix(RGB.black, 0).rgb
    assert_equal RGB.black.rgb,   RGB.white.mix(RGB.black, 1).rgb

    c = RGB.new([0,1,0.5])
    assert_equal [128, 255, 191], c.mix(RGB.white).rgb
    assert_equal [0,1,0.5], c.values
  end

  def test_mix!
    assert_equal [128, 128, 128], RGB.white.mix!(RGB.black   ).rgb
    assert_equal RGB.white.rgb,   RGB.white.mix!(RGB.black, 0).rgb
    assert_equal RGB.black.rgb,   RGB.white.mix!(RGB.black, 1).rgb
  end

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

  def test_whiten
    assert_equal RGB.black.values, RGB.black.whiten(0).values
    assert_equal RGB.white.values, RGB.black.whiten(1).values
    assert_equal [0.1, 0.1, 0.1], RGB.black.whiten(0.1).values
    assert_equal [0.75, 0.75, 0.75], RGB.black.whiten(0.75).values

    c = RGB.new
    c.whiten! 0.5
    assert_equal [0.75, 0.75, 0.75], c.values
  end

  def test_blacken
    assert_equal RGB.white.values, RGB.white.blacken(0).values
    assert_equal RGB.black.values, RGB.white.blacken(1).values
    assert_equal [0.9, 0.9, 0.9], RGB.white.blacken(0.1).values
    assert_equal [0.25, 0.25, 0.25], RGB.white.blacken(0.75).values

    c = RGB.new
    c.blacken! 0.5
    assert_equal [0.25, 0.25, 0.25], c.values
  end

end
