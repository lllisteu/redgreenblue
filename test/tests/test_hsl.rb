require 'test/unit'

require 'redgreenblue'

class Test_hsl < Test::Unit::TestCase

  def test_get_hsl
    assert_equal [  nil, 0.0, 0.0], RGB.new(0, 0, 0).hsl
    assert_equal [  nil, 0.0, 0.5], RGB.new(0.5, 0.5, 0.5).hsl
    assert_equal [  nil, 0.0, 1.0], RGB.new(1, 1, 1).hsl

    assert_equal [  0.0, 1.0, 0.5], RGB.new(1, 0, 0).hsl
    assert_equal [ 60.0, 1.0, 0.5], RGB.new(1, 1, 0).hsl
    assert_equal [120.0, 1.0, 0.5], RGB.new(0, 1, 0).hsl
    assert_equal [180.0, 1.0, 0.5], RGB.new(0, 1, 1).hsl
    assert_equal [240.0, 1.0, 0.5], RGB.new(0, 0, 1).hsl
    assert_equal [300.0, 1.0, 0.5], RGB.new(1, 0, 1).hsl
  end

  def test_get_hue
    assert_equal 150, RGB.new(0.4, 1, 0.7).hsl_h
  end

  def test_get_saturation
    assert_equal 1.0, RGB.new(0.4, 1, 0.7).hsl_s
  end

  def test_get_lightness
    assert_equal 0.7, RGB.new(0.4, 1, 0.7).hsl_l
  end

  def test_from_hsl
    assert_equal RGB.new(0, 0, 0), RGB.hsl(nil, 0, 0)
    assert_equal RGB.new(0.5, 0.5, 0.5), RGB.hsl(nil, 0, 0.5)
    assert_equal RGB.new(1, 1, 1), RGB.hsl(nil, 0, 1)

    assert_equal RGB.new(1, 1, 1), RGB.hsl(nil,1,1)
    assert_equal RGB.new(1, 1, 1), RGB.hsl(6,1,1)

    assert_equal RGB.new(1, 0, 0), RGB.hsl(  0, 1, 0.5)
    assert_equal RGB.new(1, 1, 0), RGB.hsl( 60, 1, 0.5)
    assert_equal RGB.new(0, 1, 0), RGB.hsl(120, 1, 0.5)
    assert_equal RGB.new(0, 1, 1), RGB.hsl(180, 1, 0.5)
    assert_equal RGB.new(0, 0, 1), RGB.hsl(240, 1, 0.5)
    assert_equal RGB.new(1, 0, 1), RGB.hsl(300, 1, 0.5)
  end

  def test_set_hue
    c = RGB.new(1, 0, 0)
    c.hsl_h = 180
    assert_equal RGB.new(0, 1, 1), c

    c.hsl_h = nil
    assert_equal 0, c.hsl_s
  end

  def test_set_saturation
    c = RGB.new(1, 0, 0)
    c.hsl_s = 0.75
    assert_equal RGB.new(0.875, 0.125, 0.125), c

    c.hsl_s = 0
    assert_nil c.hsl_h
  end

  def test_set_lightness
    c = RGB.new(1, 0, 0)
    c.hsl_l = 0.75
    assert_equal RGB.new(1, 0.5, 0.5), c

    c.hsl_l = 1
    assert_equal RGB.new(1, 1, 1), c
  end

  def test_hsl_rotate
    assert_equal RGB.new(1,1,0), RGB.new(1,0,0).hsl_rotate(60)
    assert_equal [121, 164, 255], RGB.rgb(255, 212, 121).hsl_rotate(180).rgb
    assert_equal [nil, 0, 0.5], RGB.new(0.5, 0.5, 0.5).hsl_rotate(60).hsl

    assert_equal [RGB.magenta, RGB.yellow], RGB.red.hsl_rotate(-60, 60)

    c = RGB.new(1, 0, 0)
    c.hsl_rotate!(420)
    assert_equal [1, 1, 0], c.values
  end

  def test_bugs
    assert_equal [330.0, 1.0, 0.8], RGB.hex('f9c').hsl
    assert_equal [ 42.0, 0.8, 0.5], RGB.hsl(42, 0.8, 0.5).hsl
  end

end
