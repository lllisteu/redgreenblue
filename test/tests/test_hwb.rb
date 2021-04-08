require 'test/unit'

require 'redgreenblue'

class Test_hwb < Test::Unit::TestCase

  def test_get_hwb
    assert_equal [nil, 0  , 1   ], RGB.new(0  , 0  , 0  ).hwb
    assert_equal [nil, 0.5, 0.5 ], RGB.new(0.5, 0.5, 0.5).hwb
    assert_equal [nil, 1  , 0   ], RGB.new(1  , 1  , 1  ).hwb

    assert_equal [330, 0.6, 0], RGB.hex('f9c').hwb
  end

end
