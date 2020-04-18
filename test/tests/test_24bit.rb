require 'test/unit'

require 'redgreenblue'

class Test_24bit < Test::Unit::TestCase

  # assign value, expect result
  def helper_r_g_b(value,result)
    c = RGB.new
    c.r = value
    assert_equal result, c.r
    c.g = value
    assert_equal result, c.g
    c.b = value
    assert_equal result, c.b
  end

  def helper_rgb(value,result)
    c = RGB.new
    c.rgb = [value, value, value]
    assert_equal [result, result, result], c.rgb
    c.rgb = value, value, value
    assert_equal [result, result, result], c.rgb

  end

  def helper_factory(value,result)
    c = RGB.rgb [value, value, value]
    assert_equal [result, result, result], c.rgb
    c = RGB.rgb value, value, value
    assert_equal [result, result, result], c.rgb
  end

  def test_assignment
    (0..255).each do |v|
      helper_r_g_b(v, v)
      helper_rgb(v,v)
      helper_factory(v,v)
    end
  end

  def test_normalize_low
    [ -1, 0, -255 ].each do |v|
      helper_r_g_b(v, 0)
    end
  end

  def test_normalize_high
    [ 256, 123456789].each do |v|
      helper_r_g_b(v,255)
    end
  end

  def test_snap
    c = RGB.new
    assert_equal [128.0/255, 128.0/255, 128.0/255], c.snap.values
    assert_equal [127.5/255, 127.5/255, 127.5/255], c.values
    c.snap!
    assert_equal [128.0/255, 128.0/255, 128.0/255], c.values

    assert_equal [1.0, 128.0/255, 0.0], RGB.new(254.5/255, 1.0/2, 0.4/255).snap.values
  end

end
