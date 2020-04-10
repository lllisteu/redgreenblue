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

  def test_set_hue
    c = RGB.new(1, 0, 0)
    c.hsb_h = 180
    assert_equal RGB.new(0, 1, 1), c

    c.hsb_h = nil
    assert_equal 0, c.hsb_s
  end

  def test_set_saturation
    c = RGB.new(1, 0, 0)
    c.hsb_s = 0.75
    assert_equal RGB.new(1, 0.25, 0.25), c

    c.hsb_s = 0
    assert_nil c.hsb_h
  end

  def test_set_brightness
    c = RGB.new(1, 0, 0)
    c.hsb_b = 0.75
    assert_equal RGB.new(0.75, 0, 0), c

    c.hsb_b = 0
    assert_equal RGB.new(0, 0, 0), c
  end


end
