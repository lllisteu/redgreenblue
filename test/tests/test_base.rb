require 'test/unit'

require 'redgreenblue'

class Test_base < Test::Unit::TestCase

  def test_initialize
    assert_equal [ 0.5, 0.5, 0.5 ], [ RGB.new.red, RGB.new.green, RGB.new.blue ]
    assert_equal [ 0.5, 0.5, 0.5 ], RGB.new.values
  end

  # assign v, expect r
  def helper(v,r)
    c = RGB.new([v,v,v])
    assert_equal [r,r,r], [ c.red, c.green, c.blue ]
    c = RGB.new v,v,v
    assert_equal [r,r,r], c.to_a

    c = RGB.new
    c.values = [v,v,v]
    assert_equal [r,r,r], c.values
    c.values = v,v,v
    assert_equal [r,r,r], c.values

    c = RGB.new
    c.red   = v
    assert_equal r, c.red
    c.green = v
    assert_equal r, c.green
    c.blue  = v
    assert_equal r, c.blue
  end

  # assign valid values 0..1
  def test_assignment
    [ 0, 0.001, 0.00001, 0.5, 1/3.0, 1/7.0, 1, 1.0, 0.9, 0.99, 0.9999, 0.99999 ].each do |v|
      helper(v,v)
    end
  end

  # assign values below 0
  def test_normalize_low
    [ 0, -0, -0.1, -0.001, -0.00000001, -123456789, -123456789.987654321, -1/7.0 ].each do |v|
      helper(v,0)
    end
  end

  # assign values above 1
  def test_normalize_high
    [ 1, 1.1, 1.001, 1.00000001, 123456789, 123456789.987654321 ].each do |v|
      helper(v,1)
    end
  end

end
