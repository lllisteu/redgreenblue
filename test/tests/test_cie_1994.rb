require 'test/unit'

require 'redgreenblue'

class Test_cie_1994 < Test::Unit::TestCase

  # Compare our ΔE with Bruce Lindbloom's
  def test_delta_e_cie_1994_bruce_lindbloom

    # All ΔE test values calculated with:
    # - http://www.brucelindbloom.com/ColorDifferenceCalc.html

    # L*a*b* values fed into Bruce Lindbloom's calculator
    # as calculated with redgreenblue:
    #
    # RGB.white.lab: [ 100.0       ,   0.0       ,    0.0        ]
    # RGB.black.lab: [   0.0       ,   0.0       ,    0.0        ]
    # RGB.red.lab:   [  53.24078887,  80.09249429,   67.2031914  ]
    # RGB.green.lab: [  87.73472019, -86.18271462,   83.17930985 ]
    # RGB.blue.lab:  [  32.29700944,  79.1875174 , -107.86016289 ]

    # Zero difference between identical colors
    assert_equal 0, RGB.black.delta_e_cie_1994(RGB.black)
    assert_equal 0, RGB.green.delta_e_cie_1994(RGB.green)

    # Note: before comparing, we are rounding both values to 3 decimal digits.

    # blue is reference, red is sample; graphic arts (default)
    assert_equal 61.242075.round(3), RGB.blue.delta_e_cie_1994(RGB.red).round(3)

    # blue is reference, red is sample; textiles
    assert_equal 61.104673.round(3), RGB.blue.delta_e_cie_1994(RGB.red, k1: 0.048, k2: 0.014, kl: 2).round(3)

    # red is reference, blue is sample; graphic arts (default)
    assert_equal 70.580473.round(3), RGB.red.delta_e_cie_1994(RGB.blue).round(3)

    # red is reference, blue is sample; textiles
    assert_equal 71.003011.round(3), RGB.red.delta_e_cie_1994(RGB.blue, k1: 0.048, k2: 0.014, kl: 2).round(3)

  end

  def test_aliases
    assert_equal RGB.white.delta_e_cie_1994(RGB.black), RGB.white.de94(RGB.black)
  end

end
