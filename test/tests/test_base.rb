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

  def test_sorted_hash
    c = RGB.new
    assert_equal [:red, :green, :blue], c.to_h.keys
    c.green = 0
    assert_equal [:red, :blue, :green], c.to_h.keys
    c.red = 0.499999
    assert_equal [:blue, :red, :green], c.to_h.keys
  end

  def test_equality
    assert_true RGB.new == RGB.new
    assert_true RGB.white == RGB.hex('fff')

    assert_false RGB.red == RGB.green
    assert_false RGB.new(0,0.0000001,0) == RGB.black
    assert_false RGB.new(1,0.9999999,1) == RGB.white
  end

  def test_space
    assert_equal 'sRGB', RGB.new.color_space
  end

end
