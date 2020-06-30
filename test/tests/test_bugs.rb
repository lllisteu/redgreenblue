require 'test/unit'

require 'redgreenblue'

class Test_bugs < Test::Unit::TestCase

  # Calling Gamma & CIE methods on a frozen object.
  def test_bug_20200629_frozen
    c = RGB.new.freeze
    assert_equal String, c.color_space.class
    assert_equal Array , c.linear_values.class
    assert_equal Array , c.cie_xyz.class
  end

end
