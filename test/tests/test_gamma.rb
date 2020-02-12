require 'test/unit'

require 'redgreenblue'

class Test_gamma < Test::Unit::TestCase

  def test_linear
    assert_equal [1.0, 1.0, 1.0], RGB.white.linear_values
    assert_equal [0.0, 0.0, 0.0], RGB.black.linear_values

    # https://entropymine.com/imageworsener/srgbformula/
    assert_equal [0.00313080, 0.00313080, 0.00313080], RGB.grey(0.04045).linear_values.map { |v| v.round(8) }
  end

end
