require 'test/unit'

require 'redgreenblue'

class Test_web < Test::Unit::TestCase

  def test_css_hex
    assert_equal '#fb0'   , RGB.rgb(255,187,0).css_hex
    assert_equal '#ffbc00', RGB.rgb(255,188,0).css_hex
    assert_equal '#f9c'   , RGB.new(1, 0.6, 0.8).css_hex
  end

  def test_css_names
    assert_true RGB.white.css_names.any?
    assert_equal 2, RGB.hex('f0f').css_names.size
  end

  def test_css_palette
    assert_true  RGB.css.size > 147
    assert_true  RGB.css.all? RGB::Color
    assert_equal RGB.css, RGB.css( /./ )
    assert_equal RGB.css.first, RGB.css( RGB.css(0).name )
    assert_true  RGB.css( RGB.css.first ).size > 0
    assert_nil   RGB.css 'this is not a color name'
  end

  def test_wcag20_luminance
    assert_equal 0, RGB.black.wcag20_luminance
    assert_equal 1, RGB.white.wcag20_luminance
  end

  def test_wcag20_contrast_ratio
    # Test values generated with the WebAIM Contrast Checker,
    # which truncates (not rounds), results to 2 decimals.
    # See https://webaim.org/resources/contrastchecker/
    assert_equal 10.68, RGB.hex('ff99cc').wcag20_contrast_ratio(RGB.hex('000000')).floor(2)
    assert_equal  8   , RGB.hex('0000ff').wcag20_contrast_ratio(RGB.hex('ffff00')).floor(2)
    assert_equal 21   , RGB.hex('ffffff').wcag20_contrast_ratio(RGB.hex('000000')).floor(2)
    assert_equal  1   , RGB.hex('ffbb00').wcag20_contrast_ratio(RGB.hex('ffbc00')).floor(2)

    # Order does not matter (does not distinguish foreground/background).
    a = RGB.hex '123456'
    b = RGB.hex 'fedcba'
    assert_equal a.wcag20_contrast_ratio(b), b.wcag20_contrast_ratio(a)
  end

  def test_web_safe
    assert_true  RGB.red.web_safe?
    assert_true  RGB.new(0.20, 0.0, 0.8).web_safe?
    assert_false RGB.new(0.21, 0.0, 0.8).web_safe?
  end

end
