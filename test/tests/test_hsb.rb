require 'test/unit'

require 'redgreenblue'

class Test_hsb < Test::Unit::TestCase

  def test_hsb
    assert_equal [315.0, 0.8, 1.0], RGB.hex('f3c').hsb
  end

end
