require 'test/unit'

require 'redgreenblue'

class Test_misc < Test::Unit::TestCase

  def test_mix
    assert_equal [128, 128, 128], RGB.white.mix(RGB.black   ).rgb
    assert_equal RGB.white.rgb,   RGB.white.mix(RGB.black, 0).rgb
    assert_equal RGB.black.rgb,   RGB.white.mix(RGB.black, 1).rgb
  end

end
