# Optional support for converting colors between redgreenblue and Color.

# Automatically load core RGB module before loading options.
require 'redgreenblue'

module RGB
  class Color

    # Returns the color converted to a Color::RGB object.
    #
    # This makes it easier to use redgreenblue together with the Color gem.
    #
    # Only available when optional support for the Color gem is loaded, like this:
    #  require 'color'
    #  require 'redgreenblue/opt/color'
    #
    # For information about the Color gem, see:
    # - https://rubygems.org/gems/color
    #
    # @example
    #  RGB.cyan.to_color_rgb
    def to_color_rgb
      ::Color::RGB.from_fraction *to_a
    end

  end
end


module Color
  class RGB

    # Returns the color converted to a redgreenblue RGB::Color object.
    #
    # This makes it easier to use the Color gem together with redgreenblue.
    #
    # Only available when optional support for the Color gem is loaded, like this:
    #  require 'color'
    #  require 'redgreenblue/opt/color'
    #
    # For information about the Color gem, see:
    # - https://rubygems.org/gems/color
    #
    # @example
    #  Color::RGB.new(100,0,50).to_redgreenblue.view
    def to_redgreenblue
      ::RGB.new to_a
    end

  end
end
