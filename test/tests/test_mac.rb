require 'test/unit'

require 'redgreenblue'

class Test_mac < Test::Unit::TestCase

  def test_applescript
    assert_equal '{65535, 39321, 52428}', RGB.hex('f9c').applescript
  end

end

