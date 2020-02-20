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

  def test_permutation
    assert_equal 1, RGB.hex('aaa').permutation.size
    assert_equal 3, RGB.hex('abb').permutation.size
    assert_equal 6, RGB.hex('abc').permutation.size

    assert_equal RGB.red.permutation, [ RGB.red, RGB.green, RGB.blue ]
  end

  def test_components
    assert_equal 3, RGB.new.components.size
    assert_equal ['ff0000', '00ff00', '0000ff'], RGB.white.components.map(&:hex)
  end

  def test_assemble
    assert_equal RGB.white, RGB.assemble(RGB.red, RGB.green, RGB.blue)
    assert_equal RGB.white, RGB.assemble(RGB.yellow, RGB.cyan, RGB.magenta)
  end

end
