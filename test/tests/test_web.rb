require 'test/unit'

require 'redgreenblue'

class Test_web < Test::Unit::TestCase

  def test_css_hex
    assert_equal '#fb0'   , RGB.rgb(255,187,0).css_hex
    assert_equal '#ffbc00', RGB.rgb(255,188,0).css_hex
    assert_equal '#f9c'   , RGB.new(1, 0.6, 0.8).css_hex
  end

  def test_css_palette
    assert_true  RGB.css.size > 147
    assert_true  RGB.css.all? { |c| c.class == RGB }
    assert_equal RGB.css, RGB.css( /./ )
    assert_equal RGB.css.first, RGB.css( RGB.css(0).name )
    assert_true  RGB.css( RGB.css.first ).size > 0
    assert_nil   RGB.css 'this is not a color name'
  end

end
