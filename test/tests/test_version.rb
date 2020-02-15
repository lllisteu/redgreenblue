require 'test/unit'

require 'redgreenblue'

class Test_version < Test::Unit::TestCase

  def test_simple
    assert_equal String, RGB.version.class
  end

end
