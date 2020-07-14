require 'test/unit'

require 'redgreenblue'

class Test_cie_1976 < Test::Unit::TestCase

  # Test CIE 1976 L*a*b* values calculated with:
  # - http://www.brucelindbloom.com/ColorCalculator.html
  def test_lab
    assert_equal [  53.2407_8887,  80.0924_9429,   67.2031_9140 ], RGB.new( 1  , 0  , 0   ).cie_lab
    assert_equal [  97.1392_6343, -21.5537_2849,   94.4779_6332 ], RGB.new( 1  , 1  , 0   ).cie_lab
    assert_equal [  87.7347_2019, -86.1827_1462,   83.1793_0985 ], RGB.new( 0  , 1  , 0   ).cie_lab
    assert_equal [  91.1132_1748, -48.0875_2803,  -14.1311_9038 ], RGB.new( 0  , 1  , 1   ).cie_lab
    assert_equal [  32.2970_0944,  79.1875_1740, -107.8601_6289 ], RGB.new( 0  , 0  , 1   ).cie_lab
    assert_equal [  60.3242_0719,  98.2343_3854,  -60.8248_9901 ], RGB.new( 1  , 0  , 1   ).cie_lab

    assert_equal [   0          ,   0          ,    0           ], RGB.new( 0  , 0  , 0   ).cie_lab
    assert_equal [  53.3889_6474,   0          ,    0           ], RGB.new( 0.5, 0.5, 0.5 ).cie_lab
    assert_equal [ 100          ,   0          ,    0           ], RGB.new( 1  , 1  , 1   ).cie_lab
  end

  def test_aliases
    assert_equal RGB.white.cie_lab, RGB.white.lab
  end

end
