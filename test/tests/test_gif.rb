require 'test/unit'

require 'redgreenblue'

class Test_gif < Test::Unit::TestCase

  def test_gif_pixel
    assert_equal 35, RGB.rgb([0,255,128]).gif_pixel.bytesize
    assert_equal 'ASCII-8BIT', RGB.new.gif_pixel.encoding.name
  end

end
