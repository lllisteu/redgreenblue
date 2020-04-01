require 'test/unit'

require 'redgreenblue'

class Test_rgb565 < Test::Unit::TestCase

  def test_rgb565
    assert_equal "\xff\xff".b, RGB.rgb([255,255,255]).rgb565
    assert_equal "\x00\x00".b, RGB.rgb([0,0,0]).rgb565

    assert_equal "\x00\x00".b, RGB.rgb([1,1,1]).rgb565
    assert_equal "\x00\x00".b, RGB.rgb([7,3,7]).rgb565
  end

  def test_rgb565reverse
    range = (0..31).each.map { |v| v * 8 }
    range.each do |r|
      range.each do |g|
        range.each do |b|
          c = RGB.rgb( [r, g, b] )
          rgb16bit = c.rgb565
          c.rgb565 = rgb16bit
          assert_equal [r, g, b], c.rgb
        end
      end
    end
  end

  def test_factory
    assert_equal [0, 0, 0], RGB.rgb565("\x00\x00".b).rgb
  end

end
