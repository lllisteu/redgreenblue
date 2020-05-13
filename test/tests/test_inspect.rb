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

end
