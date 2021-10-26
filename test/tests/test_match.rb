require 'test/unit'

require 'redgreenblue'

class Test_match < Test::Unit::TestCase

  def test_match_distance
    assert_equal RGB.hex('ffb6c1'), RGB.hex('f9c').match_distance(RGB.css).first.first
    assert_equal RGB.yellow, RGB.hex('96ea4c').match_distance(RGB.corners).first.first
  end

  def test_match_de76
    assert_equal RGB.hex('dda0dd'), RGB.hex('f9c').match_de76(RGB.css).first.first
    assert_equal RGB.green, RGB.hex('96ea4c').match_de76(RGB.corners).first.first
  end

  def test_match_de94
    assert_equal RGB.white, RGB.hex('f9c').match_de94(RGB.corners).first.first
    assert_equal RGB.green, RGB.hex('96ea4c').match_de94(RGB.corners).first.first
  end

end
