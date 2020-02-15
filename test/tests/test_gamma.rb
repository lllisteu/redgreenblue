require 'test/unit'

require 'redgreenblue'

class Test_gamma < Test::Unit::TestCase

  def test_linear_get
    assert_equal [1.0, 1.0, 1.0], RGB.white.linear_values
    assert_equal [0.0, 0.0, 0.0], RGB.black.linear_values

    # https://entropymine.com/imageworsener/srgbformula/
    assert_equal [0.00313080, 0.00313080, 0.00313080], RGB.grey(0.04045).linear_values.map { |v| v.round(8) }
  end

  def test_linear_set
    c = RGB.grey

    c.linear_values = [1, 1, 1]
    assert_equal [1, 1, 1], c.values

    c.linear_values = [0, 0, 0]
    assert_equal [0, 0, 0], c.values

    # https://entropymine.com/imageworsener/srgbformula/
    c.linear_values = [0.00313080, 0.00313080, 0.00313080]
    assert_equal [0.04045, 0.04045, 0.04045], c.values.map { |v| v.round(6)}
  end

end
