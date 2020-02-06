require 'test/unit'

require 'redgreenblue'

class Test_int < Test::Unit::TestCase

  def test_to_i
    assert_equal        0, RGB.black.to_i
    assert_equal 16777215, RGB.white.to_i

    # https://codegolf.stackexchange.com/questions/43155
    assert_equal  4563356, RGB.rgb(69,161,156).to_i
  end

  def test_at
    assert_equal RGB.black, RGB.at(       0)
    assert_equal RGB.white, RGB.at(16777215)

    assert_equal RGB.black, RGB.at(0.9)

    # https://codegolf.stackexchange.com/questions/43155
    assert_equal RGB.rgb(69,161,156), RGB.at(4563356)
  end

end
