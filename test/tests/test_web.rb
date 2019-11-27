require 'test/unit'

require 'redgreenblue'

class Test_web < Test::Unit::TestCase

  def test_simple
    assert_equal '#fb0'   , RGB.rgb(255,187,0).css_hex
    assert_equal '#ffbc00', RGB.rgb(255,188,0).css_hex
    assert_equal '#f9c'   , RGB.new(1, 0.6, 0.8).css
  end

end
