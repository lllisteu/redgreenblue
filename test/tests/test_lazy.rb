require 'test/unit'

require 'redgreenblue'

class Test_lazy < Test::Unit::TestCase

  def test_factory
    assert_equal [255, 255, 255], RGB.white.rgb
    assert_equal [  0,   0,   0], RGB.black.rgb
  end

end
