require 'test/unit'

require 'redgreenblue'

class Test_inspect < Test::Unit::TestCase

  def test_to_s
    assert_equal String, RGB.new.to_s.class
  end

  def test_inspect
    old_style = RGB.style
    RGB.styles.each do |s|
      RGB.style = s
      assert_equal s, RGB.style
      assert_equal String, RGB.new.inspect.class
    end
    RGB.style = old_style
  end

  def test_hex_approximate
    old_style = RGB.style
    RGB.style = 'hex'
    assert_equal '#000000', RGB.new(0    ,0,0).inspect
    assert_equal '~000000', RGB.new(0.001,0,0).inspect
    RGB.style = old_style
  end

end
