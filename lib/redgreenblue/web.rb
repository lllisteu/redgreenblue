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
      @@css ||= load_gpl file: ( File.dirname(__FILE__) + '/palettes/css.gpl' ), freeze: true
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

end
