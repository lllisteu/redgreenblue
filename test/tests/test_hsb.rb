require 'test/unit'

require 'redgreenblue'

class Test_hsb < Test::Unit::TestCase

  def test_get_hsb
    assert_equal [315.0, 0.8, 1.0], RGB.hex('f3c').hsb
  end

  def test_get_hue
    assert_equal 270, RGB.new(0.7, 0.4, 1).hsb_h
  end

  def test_get_saturation
    assert_equal 0.6, RGB.new(0.7, 0.4, 1).hsb_s
  end

  def test_get_brightness
    assert_equal   1, RGB.new(0.7, 0.4, 1).hsb_b
  end

end
