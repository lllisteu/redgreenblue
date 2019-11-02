require 'test/unit'

require 'redgreenblue'

class Test_nice < Test::Unit::TestCase

  def test_inspect
    assert_equal String, RGB.new.inspect.class
  end

  def test_to_s
    assert_equal String, RGB.new.to_s.class
  end

end
