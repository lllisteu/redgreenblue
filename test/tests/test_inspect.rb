require 'test/unit'

require 'redgreenblue'

class Test_inspect < Test::Unit::TestCase

  def test_simple
    assert_equal String, RGB.new.inspect.class
    assert_equal String, RGB.new.to_s.class
  end

end
