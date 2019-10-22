require 'test/unit'

require 'redgreenblue'

class Test_hsb < Test::Unit::TestCase

  def test_hsb
    assert_equal [nil, 0, 0.5], RGB.grey.hsb
    assert_equal [nil, 0, 0  ], RGB.black.hsb
    assert_equal [nil, 0, 1  ], RGB.white.hsb

    assert_equal [  0, 1, 1], RGB.new(1,0,0).hsb
    assert_equal [ 60, 1, 1], RGB.new(1,1,0).hsb
    assert_equal [120, 1, 1], RGB.new(0,1,0).hsb
    assert_equal [180, 1, 1], RGB.new(0,1,1).hsb
    assert_equal [240, 1, 1], RGB.new(0,0,1).hsb
    assert_equal [300, 1, 1], RGB.new(1,0,1).hsb

    assert_equal [ 90, 1, 1  ], RGB.new(0.5,1,0).hsb
    assert_equal [300, 1, 0.5], RGB.new(0.5,0,0.5).hsb

    assert_equal [210, 2.0/3, 0.3], RGB.new(0.1,0.2,0.3).hsb
  end

end
