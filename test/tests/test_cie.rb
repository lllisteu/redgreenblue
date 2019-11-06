require 'test/unit'

require 'redgreenblue'

class Test_cie < Test::Unit::TestCase

  def test_simple

    # https://ninedegreesbelow.com/photography/xyz-rgb.html
    # "If you add up the Y values for the Red, Blue, and Green primaries...the sum is always 1.0000".
    assert_equal 1.000000, (RGB.red.xyz[1] + RGB.green.xyz[1] + RGB.blue.xyz[1]).round(6)
  end

end

