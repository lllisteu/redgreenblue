require 'test/unit'

require 'redgreenblue'

class Test_hsl_hsv < Test::Unit::TestCase

  def test_hsl
    assert_equal [  nil, 0.0, 1.0], RGB.hex('#FFFFFF').hsl
    assert_equal [  nil, 0.0, 0.0], RGB.hex('#000000').hsl
    assert_equal [  0.0, 1.0, 0.5], RGB.hex('#FF0000').hsl
    assert_equal [120.0, 1.0, 0.5], RGB.hex('#00FF00').hsl
    assert_equal [240.0, 1.0, 0.5], RGB.hex('#0000FF').hsl
  end

  def test_hsv
    assert_equal [nil, 0, 0.5], RGB.grey.hsv
    assert_equal [nil, 0, 0  ], RGB.black.hsv
    assert_equal [nil, 0, 1  ], RGB.white.hsv

    assert_equal [  0, 1, 1], RGB.new(1,0,0).hsv
    assert_equal [ 60, 1, 1], RGB.new(1,1,0).hsv
    assert_equal [120, 1, 1], RGB.new(0,1,0).hsv
    assert_equal [180, 1, 1], RGB.new(0,1,1).hsv
    assert_equal [240, 1, 1], RGB.new(0,0,1).hsv
    assert_equal [300, 1, 1], RGB.new(1,0,1).hsv

    assert_equal [ 90, 1, 1  ], RGB.new(0.5,1,0).hsv
    assert_equal [300, 1, 0.5], RGB.new(0.5,0,0.5).hsv

    assert_equal [210, 2.0/3, 0.3], RGB.new(0.1,0.2,0.3).hsv
  end

  def test_hsb
    assert_equal [315, 0.8, 1], RGB.hex('f3c').hsb
  end

  def test_bugs
    assert_equal 1.0, RGB.hex('f9c').hsl[1]
  end

end
