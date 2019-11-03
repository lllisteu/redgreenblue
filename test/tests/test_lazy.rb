require 'test/unit'

require 'redgreenblue'

class Test_lazy < Test::Unit::TestCase

  def test_factory
    assert_equal [255, 255, 255], RGB.white.rgb
    assert_equal [  0,   0,   0], RGB.black.rgb
    assert_equal [ 85,  85,  85], RGB.grey(1.0/3).rgb
    assert_equal [ 51,  51,  51], RGB.gray(1.0/5).rgb

    assert_equal [255,   0,   0], RGB.red.rgb
    assert_equal [  0, 255,   0], RGB.green.rgb
    assert_equal [  0,   0, 255], RGB.blue.rgb
  end

end
