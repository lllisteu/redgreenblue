class RGB::Color

  # Returns a 6-digit hexadecimal string representing the object's red, green, and blue components as 8-bit values.
  #
  # If shorthand is true, returns 3-digit shorthand if possible.
  def hex(shorthand=false)
    if shorthand
      RGB.hex_shorthand hex6
    else
      hex6
    end
  end

  # Sets red, green, and blue using a 6- or 3-digit hexadecimal string.
  #
  # The string may include a '#' prefix.
  def hex=(hex_string)
    if rgb = RGB.hex_to_rgb(hex_string)
      self.rgb = rgb
    else
      raise ArgumentError, "'#{hex_string}' is not a usable hexadecimal string"
    end
  end

  private

  def hex6
    '%02x%02x%02x' % [ r, g, b ]
  end

  #----------------------------------------------------------------------#
  #                            Class Methods                             #
  #----------------------------------------------------------------------#

  # Creates a new Color object from a 6- or 3-digit hexadecimal string representing red, green, and blue.
  #
  # The string may include a '#' prefix.
  def self.hex(hex_string)
    if rgb = RGB.hex_to_rgb(hex_string)
      self.rgb rgb
    else
      raise ArgumentError, "'#{hex_string}' is not a usable hexadecimal string"
    end
  end

end

module RGB

  class << self

    # Creates a new Color object from a 6- or 3-digit hexadecimal string representing red, green, and blue.
    #
    # The string may include a '#' prefix.
    def hex(hex_string)
      Color.hex(hex_string)
    end

    # Returns a 3-digit shorthand version of a 6-digit hexadecimal string.
    #
    # If a shorthand version is not possible, returns the original string.
    def hex_shorthand(hex_string)
      hex_string.sub( /^(#?)(\h)\2(\h)\3(\h)\4$/, '\1\2\3\4' )
    end

    # Parses a 6- or 3-digit hexadecimal string.
    # Returns three integers in the range 0..255, or nil if not successful.
    #
    # The string may include a '#' prefix.
    def hex_to_rgb(hex_string)
      if hex_string =~ /^(#?)(\h\h)(\h\h)(\h\h)$/
        [$2, $3, $4].map { |h| h.to_i(16) }
      elsif hex_string =~ /^(#?)(\h)(\h)(\h)$/
        [$2, $3, $4].map { |h| (h*2).to_i(16) }
      else
        nil
      end
    end

  end

end
