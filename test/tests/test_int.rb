require 'test/unit'

require 'redgreenblue'

class Test_int < Test::Unit::TestCase

  def test_simple
    assert_equal        0, RGB.black.to_i
    assert_equal 16777215, RGB.white.to_i

    # https://codegolf.stackexchange.com/questions/43155
    assert_equal  4563356, RGB.rgb(69,161,156).to_i
  end

end
