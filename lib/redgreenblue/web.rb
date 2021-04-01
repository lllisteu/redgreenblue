class RGB

  #----------------------------------------------------------------------#
  #                            Class Methods                             #
  #----------------------------------------------------------------------#

  class << self

    # Returns CSS named colors, as per CSS Color Module Level 4.
    #
    # Optional selector argument can be:
    # - String or Regexp (to select by name)
    # - RGB color (to select by color)
    # - Integer (to select by index).
    # Selection by name (string or regular expression) is case-insensitive by default.
    #
    # @example No Selector
    #  # All colors
    #  RGB.css
    #
    #  # Pastels
    #  RGB.css.select { |c| c.ostwald_cwk[1] > 0.6 }
    # @example Select by Name
    #  # Exact name
    #  RGB.css 'pink'
    #
    #  # Regular expression
    #  RGB.css /pink|rose/
    #
    # @example Select by RGB color
    #  RGB.css RGB.hex('0ff')
    def css(selector=nil)
      @@css ||= load_gpl file: ( File.join File.dirname(__FILE__), 'palettes', 'css.gpl' ), freeze: true
      case selector
        when NilClass
          @@css
        when String
          n = selector.downcase
          @@css.select { |c| c.name == n }.first
        when Regexp
          r = Regexp.new selector.source, Regexp::IGNORECASE
          @@css.select { |c| c.name =~ r }
        when Integer
          @@css[selector]
        when self
          @@css.select { |c| c == selector }
        else
          raise ArgumentError, 'Unsupported selector'
      end
    end

  end

  #----------------------------------------------------------------------#
  #                           Instance Methods                           #
  #----------------------------------------------------------------------#

  # Returns the object's RGB value in hexadecimal notation as used in CSS.
  #
  # Shortens to 3 digits when possible.
  def css_hex
    "##{hex true}"
  end

  # Returns the color's relative luminance, as defined by the Web Content Accessibility Guidelines (WCAG) 2.0.
  #
  # This is different from the Y component of CIE 1931 XYZ.
  #
  # Based on:
  # - https://www.w3.org/TR/WCAG20/#relativeluminancedef
  def wcag20_luminance(round: true)
    if color_space == 'sRGB'
      values.map { |v|
        if v <= 0.03928
          v / 12.92
        else
          ( ( v + 0.055 ) / 1.055 ) ** 2.4
        end
      }.zip( [0.2126, 0.7152, 0.0722] ).map { |c,f|
        c * f
      }.inject(:+).instance_eval { |v| round ? v.round(8) : v }
    else
      raise "can not calculate luminance for color space '#{color_space}'"
    end
  end

  # Returns the contrast ratio for this color and another color, as defined by the Web Content Accessibility Guidelines (WCAG) 2.0.
  #
  # Based on:
  # - https://www.w3.org/TR/WCAG20/#contrast-ratiodef
  def wcag20_contrast_ratio(another, round: true)
    luminances = [
      wcag20_luminance(round: false),
      another.wcag20_luminance(round: false)
    ].sort.reverse

    contrast_ratio = ( luminances[0] + 0.05 ) / ( luminances[1] + 0.05 )

    round ? contrast_ratio.round(8) : contrast_ratio
  end

end
