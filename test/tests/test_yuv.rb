require 'test/unit'

require 'redgreenblue'

class Test_yuv < Test::Unit::TestCase

  def test_to_yuv
    assert_equal [0  , 0, 0], RGB.black.yuv
    assert_equal [0.5, 0, 0], RGB.grey.yuv
    assert_equal [1  , 0, 0], RGB.white.yuv
  end

end
