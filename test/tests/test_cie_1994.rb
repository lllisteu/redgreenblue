require 'test/unit'

require 'redgreenblue'

class Test_cie_1994 < Test::Unit::TestCase

  def test_delta_e_cie_1994
    assert_equal 0, RGB.black.delta_e_cie_1994(RGB.black)
    assert_equal 0, RGB.green.delta_e_cie_1994(RGB.green)

    # Test values calculated with:
    # - http://www.brucelindbloom.com/ColorDifferenceCalc.html
    assert_equal 50.222, RGB.new(1,0,0).delta_e_cie_1994(RGB.new(1,1,1)).round(3)
  end

  def test_aliases
    assert_equal RGB.white.delta_e_cie_1994(RGB.black), RGB.white.de94(RGB.black)
  end

end
