require 'test/unit'

require 'redgreenblue'

class Test_hsv < Test::Unit::TestCase

  def test_to_hsv
    assert_equal [nil, 0.0, 0.0], RGB.new(0, 0, 0).hsv
    assert_equal [nil, 0.0, 0.5], RGB.new(0.5, 0.5, 0.5).hsv
    assert_equal [nil, 0.0, 1.0], RGB.new(1, 1, 1).hsv

    assert_equal [  0.0, 1.0, 1.0], RGB.new(1, 0, 0).hsv
    assert_equal [ 60.0, 1.0, 1.0], RGB.new(1, 1, 0).hsv
    assert_equal [120.0, 1.0, 1.0], RGB.new(0, 1, 0).hsv
    assert_equal [180.0, 1.0, 1.0], RGB.new(0, 1, 1).hsv
    assert_equal [240.0, 1.0, 1.0], RGB.new(0, 0, 1).hsv
    assert_equal [300.0, 1.0, 1.0], RGB.new(1, 0, 1).hsv

    assert_equal [ 90.0, 1.0, 1.0], RGB.new(0.5, 1, 0).hsv
    assert_equal [300.0, 1.0, 0.5], RGB.new(0.5, 0, 0.5).hsv

    assert_equal [210.0, 2.0/3, 0.3], RGB.new(0.1, 0.2, 0.3).hsv
  end

  def test_from_hsv
    assert_equal RGB.new(0  , 0  , 0  ), RGB.hsv(nil, 0, 0  )
    assert_equal RGB.new(0.5, 0.5, 0.5), RGB.hsv(nil, 0, 0.5)
    assert_equal RGB.new(1  , 1  , 1  ), RGB.hsv(nil, 0, 1  )

    assert_equal RGB.new(1  , 1  , 1  ), RGB.hsv(nil, 1, 1  )
    assert_equal RGB.new(1  , 1  , 1  ), RGB.hsv(  0, 0, 1  )
    assert_equal RGB.new(1  , 0.1, 0  ), RGB.hsv(  6, 1, 1  )

    assert_equal RGB.new(1  , 0  , 0  ), RGB.hsv(  0, 1, 1  )
    assert_equal RGB.new(1  , 1  , 0  ), RGB.hsv( 60, 1, 1  )
    assert_equal RGB.new(0  , 1  , 0  ), RGB.hsv(120, 1, 1  )
    assert_equal RGB.new(0  , 1  , 1  ), RGB.hsv(180, 1, 1  )
    assert_equal RGB.new(0  , 0  , 1  ), RGB.hsv(240, 1, 1  )
    assert_equal RGB.new(1  , 0  , 1  ), RGB.hsv(300, 1, 1  )
  end

  def test_hsv_rotate
    assert_equal RGB.new(1,1,0), RGB.new(1,0,0).hsv_rotate(60)
    assert_equal [121, 164, 255], RGB.rgb(255, 212, 121).hsv_rotate(180).rgb
    assert_equal [nil, 0, 0.5], RGB.new(0.5, 0.5, 0.5).hsv_rotate(60).hsv

    assert_equal [RGB.red, RGB.cyan], RGB.blue.hsv_rotate(120, -60)

    c = RGB.new(1, 1, 0)
    c.hsv_rotate!(-120)
    assert_equal [1, 0, 1], c.values
  end

end
