require 'test/unit'

require 'redgreenblue'

class Test_cie < Test::Unit::TestCase

  # Test XYZ values from:
  # - http://www.brucelindbloom.com/ColorCalculator.html
  def test_case_xyz
    assert_equal [ 0.4124_5644, 0.2126_7285, 0.0193_3390 ], RGB.new( 1  , 0  , 0  ).cie_xyz
    assert_equal [ 0.7700_3252, 0.9278_2501, 0.1385_2592 ], RGB.new( 1  , 1  , 0  ).cie_xyz
    assert_equal [ 0.3575_7608, 0.7151_5216, 0.1191_9203 ], RGB.new( 0  , 1  , 0  ).cie_xyz
    assert_equal [ 0.5380_1356, 0.7873_2715, 1.0694_9610 ], RGB.new( 0  , 1  , 1  ).cie_xyz
    assert_equal [ 0.1804_3748, 0.0721_7499, 0.9503_0408 ], RGB.new( 0  , 0  , 1  ).cie_xyz
    assert_equal [ 0.5928_9392, 0.2848_4784, 0.9696_3797 ], RGB.new( 1  , 0  , 1  ).cie_xyz

    assert_equal [ 0          , 0          , 0           ], RGB.new( 0  , 0  , 0  ).cie_xyz
    assert_equal [ 0.2034_3968, 0.2140_4114, 0.2330_5441 ], RGB.new( 0.5, 0.5, 0.5).cie_xyz
    assert_equal [ 0.9504_7   , 1          , 1.0888_3    ], RGB.new( 1  , 1  , 1  ).cie_xyz
  end

  # "If you add up the Y values for the Red, Blue, and Green primaries...the sum is always 1.0000".
  # From:
  # - https://ninedegreesbelow.com/photography/xyz-rgb.html
  def test_case_y
    assert_equal 1.0000, ( RGB.red.cie_xyz[1] + RGB.green.cie_xyz[1] + RGB.blue.cie_xyz[1] )
    assert_equal 1.0000, ( RGB.red.cie_xyy[2] + RGB.green.cie_xyy[2] + RGB.blue.cie_xyy[2] )
  end

  # Test xy values from:
  # - http://www.brucelindbloom.com/ColorCalculator.html
  # - https://en.wikipedia.org/wiki/SRGB
  def test_case_xy
    assert_equal [ 0.64       , 0.33        ], RGB.new( 1  , 0  , 0   ).cie_xy
    assert_equal [ 0.4193_2011, 0.5052_4579 ], RGB.new( 1  , 1  , 0   ).cie_xy
    assert_equal [ 0.3        , 0.6         ], RGB.new( 0  , 1  , 0   ).cie_xy
    assert_equal [ 0.2246_5562, 0.3287_6025 ], RGB.new( 0  , 1  , 1   ).cie_xy
    assert_equal [ 0.15       , 0.06        ], RGB.new( 0  , 0  , 1   ).cie_xy
    assert_equal [ 0.3209_3776, 0.1541_9020 ], RGB.new( 1  , 0  , 1   ).cie_xy

    assert_equal [ 0.3127_2661, 0.3290_2313 ], RGB.new( 0.5, 0.5, 0.5 ).cie_xy
    assert_equal [ 0.3127_2661, 0.3290_2313 ], RGB.new( 1  , 1  , 1   ).cie_xy
  end

  def test_black_nan
    assert_true RGB.black.xy[0].nan?
    assert_true RGB.black.xy[1].nan?
  end

  # Test CIE 1931 values for white from:
  # - http://www.brucelindbloom.com/ColorCalculator.html
  def test_white_point
    assert_equal [ 0.9504_7   , 1          , 1.0888_3 ], RGB.white.cie_xyz
    assert_equal [ 0.3127_2661, 0.3290_2313, 1        ], RGB.white.cie_xyy
  end

  def test_aliases
    assert_equal RGB.white.cie_xyz, RGB.white.xyz
    assert_equal RGB.white.cie_xyy, RGB.white.xyy
    assert_equal RGB.white.cie_xy , RGB.white.xy
  end

end
