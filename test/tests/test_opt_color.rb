require 'test/unit'

begin
  require 'color'
rescue LoadError
  warn "Could not load 'Color'. Not testing conversions."
end

if defined? Color

  require 'redgreenblue/opt/color'

  class Test_opt_color < Test::Unit::TestCase

    def test_from_color
      assert_equal RGB.hex('f9c'), Color::RGB.from_html('f9c').to_redgreenblue
    end

    def test_to_color
      assert_equal Color::RGB.from_html('f9c'), RGB.hex('f9c').to_color_rgb
    end

  end

end
