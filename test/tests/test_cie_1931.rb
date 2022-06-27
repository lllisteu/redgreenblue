require 'test/unit'

require 'redgreenblue'

class Test_cie_1931 < Test::Unit::TestCase

  # Test XYZ values from:
  # - http://www.brucelindbloom.com/ColorCalculator.html
  XYZ_TEST_VALUES = [
    [ [ 0.4124_5643_9090, 0.2126_7285_1406, 0.0193_3389_5582 ], [ 1  , 0  , 0  ] ],
    [ [ 0.7700_3251_6734, 0.9278_2500_6693, 0.1385_2592_1464 ], [ 1  , 1  , 0  ] ],
    [ [ 0.3575_7607_7644, 0.7151_5215_5288, 0.1191_9202_5881 ], [ 0  , 1  , 0  ] ],
    [ [ 0.5380_1356_0910, 0.7873_2714_8594, 1.0694_9610_4418 ], [ 0  , 1  , 1  ] ],
    [ [ 0.1804_3748_3266, 0.0721_7499_3307, 0.9503_0407_8536 ], [ 0  , 0  , 1  ] ],
    [ [ 0.5928_9392_2356, 0.2848_4784_4712, 0.9696_3797_4119 ], [ 1  , 0  , 1  ] ],

    [ [ 0               , 0               , 0                ], [ 0  , 0  , 0  ] ],
    [ [ 0.2034_3968_2794, 0.2140_4114_0482, 0.2330_5441_4991 ], [ 0.5, 0.5, 0.5] ],
    [ [ 0.9504_7        , 1               , 1.0888_3         ], [ 1  , 1  , 1  ] ],
  ]

  def test_from_xyz
    c = RGB.rgb(1,3,2)
    XYZ_TEST_VALUES.each do |a|
      c.cie_xyz = a.first
      assert_equal a.last, c.values
      assert_equal a.last, RGB::Color.cie_xyz(a.first).values
      assert_equal a.last, RGB.cie_xyz(a.first).values
    end
  end

  def test_to_xyz
    XYZ_TEST_VALUES.each do |a|
      assert_equal a.first.map { |v| v.round 8 }, RGB.new(a.last).cie_xyz
    end
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

  # aliases drop 'cie_' prefix from method name
  def test_aliases
    assert_equal RGB.white.cie_xyz, RGB.white.xyz
    assert_equal RGB.white.cie_xyy, RGB.white.xyy
    assert_equal RGB.white.cie_xy , RGB.white.xy

    v = RGB.white.cie_xyz
    c = RGB.red
    c.xyz = v
    assert_equal RGB.white, c
    assert_equal RGB.cie_xyz(v), RGB.xyz(v)
    assert_equal RGB::Color.cie_xyz(v), RGB::Color.xyz(v)
  end

end
