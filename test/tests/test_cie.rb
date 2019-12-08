require 'test/unit'

require 'redgreenblue'

class Test_cie < Test::Unit::TestCase

  # https://ninedegreesbelow.com/photography/xyz-rgb.html
  # "If you add up the Y values for the Red, Blue, and Green primaries...the sum is always 1.0000".
  def test_case1
    assert_equal 1.0000, (RGB.red.cie_xyz[1] + RGB.green.cie_xyz[1] + RGB.blue.cie_xyz[1])
    assert_equal 1.0000, (RGB.red.cie_xyy[2] + RGB.green.cie_xyy[2] + RGB.blue.cie_xyy[2])
  end

  # Test x,y values for RGB primaries from:
  # http://www.brucelindbloom.com
  def test_case2
    assert_equal [ 0.6400, 0.3300 ], RGB.red.cie_xy
    assert_equal [ 0.3000, 0.6000 ], RGB.green.cie_xy
    assert_equal [ 0.1500, 0.0600 ], RGB.blue.cie_xy
  end

  def test_black
    assert_true RGB.black.xy[0].nan?
    assert_true RGB.black.xy[1].nan?
  end

  def test_aliases
    assert_equal RGB.white.cie_xyz, RGB.white.xyz
    assert_equal RGB.white.cie_xyy, RGB.white.xyy
    assert_equal RGB.white.cie_xy, RGB.white.xy
  end

end
