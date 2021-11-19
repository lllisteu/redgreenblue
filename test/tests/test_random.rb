require 'test/unit'

require 'redgreenblue'

class Test_random < Test::Unit::TestCase

  def test_shuffle
    10.times do
      assert_equal [0,128,255], RGB.rgb(128,255,0).shuffle!.rgb.sort
    end

    assert_equal RGB::Color, RGB.new.shuffle.class
    assert_equal [0,128,255], RGB.rgb(128,255,0).shuffle.rgb.sort

  end

  def test_randomize
    assert_equal RGB::Color, RGB.rgb(128,255,0).randomize!.class
  end

  def test_rand
    assert_equal RGB::Color, RGB.rand.class
  end

end
