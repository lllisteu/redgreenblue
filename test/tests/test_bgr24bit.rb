require 'test/unit'

require 'redgreenblue'

class Test_bgr24bit < Test::Unit::TestCase

  def test_bgr
    bgr = RGB.rgb([0,255,128]).bgr24
    assert_equal 3, bgr.bytesize

    c = RGB.new
    c.bgr24 = bgr
    assert_equal [0,255,128], c.rgb

    assert_equal [0,255,128], RGB.bgr24(bgr).rgb

  end

end
