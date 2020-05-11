require 'test/unit'

require 'redgreenblue'

class Test_mix < Test::Unit::TestCase

  def test_mix
    assert_equal [128, 128, 128], RGB.white.mix(RGB.black   ).rgb
    assert_equal RGB.white.rgb,   RGB.white.mix(RGB.black, 0).rgb
    assert_equal RGB.black.rgb,   RGB.white.mix(RGB.black, 1).rgb

    c = RGB.new([0,1,0.5])
    assert_equal [128, 255, 191], c.mix(RGB.white).rgb
    assert_equal [0,1,0.5], c.values
  end

  def test_mix!
    assert_equal [128, 128, 128], RGB.white.mix!(RGB.black   ).rgb
    assert_equal RGB.white.rgb,   RGB.white.mix!(RGB.black, 0).rgb
    assert_equal RGB.black.rgb,   RGB.white.mix!(RGB.black, 1).rgb
  end

  def test_whiten
    assert_equal RGB.black, RGB.black.whiten(0)
    assert_equal RGB.white, RGB.black.whiten(1)

    assert_equal [0.1, 0.1, 0.1], RGB.black.whiten(0.1).values
    assert_equal [0.75, 0.75, 0.75], RGB.black.whiten(0.75).values

    assert_equal  RGB.new(1,0.5,0.5) , RGB.red.whiten
    assert_equal  RGB.new(1,0.5,0.5) , RGB.red.whiten( 0.5 )
    assert_equal [RGB.new(1,0.5,0.5)], RGB.red.whiten([0.5])

    assert_equal [RGB.new(1,0.5,0.5), RGB.new(1,0.4,0.4)], RGB.red.whiten(0.5,0.4)

    c = RGB.new
    c.whiten! 0.5
    assert_equal [0.75, 0.75, 0.75], c.values
  end

  def test_blacken
    assert_equal RGB.white, RGB.white.blacken(0)
    assert_equal RGB.black, RGB.white.blacken(1)

    assert_equal [0.9, 0.9, 0.9], RGB.white.blacken(0.1).values
    assert_equal [0.25, 0.25, 0.25], RGB.white.blacken(0.75).values

    assert_equal  RGB.new(0,0.5,0.5) , RGB.cyan.blacken
    assert_equal  RGB.new(0,0.5,0.5) , RGB.cyan.blacken( 0.5 )
    assert_equal [RGB.new(0,0.5,0.5)], RGB.cyan.blacken([0.5])

    assert_equal [RGB.new(0,0.5,0.5), RGB.new(0,0.6,0.6)], RGB.cyan.blacken(0.5,0.4)

    c = RGB.new
    c.blacken! 0.5
    assert_equal [0.25, 0.25, 0.25], c.values
  end

  def test_steps
    assert_equal 1, RGB.new.steps(RGB.blue).size
    assert_equal 7, RGB.green.steps(RGB.red,7).size
    assert_equal 8, RGB.green.steps(RGB.red,7,true).size
    assert_equal [RGB.grey, RGB.black], RGB.white.steps(RGB.black,2)
    assert_equal [RGB.white, RGB.grey, RGB.black], RGB.white.steps(RGB.black,2,true)
  end
end
