class RGB

  def hex(shorthand=false)
    if shorthand
      RGB.hex_shorthand hexadecimal
    else
      hexadecimal
    end
  end

  def hex=(s)
    if ( s =~ /^(#?)(\h\h)(\h\h)(\h\h)$/ ) # 6-digit hex
      self.rgb = [ $2.to_i(16), $3.to_i(16), $4.to_i(16) ]
    elsif  ( s =~ /^(#?)(\h)(\h)(\h)$/ ) # 3-digit hex
      self.rgb = [ ($2*2).to_i(16), ($3*2).to_i(16), ($4*2).to_i(16) ]
    end
  end

  # factory method
  def self.hex(s)
    c = self.new
    c.hex = s
    c
  end

  def self.hex_shorthand(h)
    h.sub( /^(#?)(\h)\2(\h)\3(\h)\4$/, '\1\2\3\4' )
  end

  # Parses a 6- or 3-digit hexadecimal string.
  # Returns three integers in the range 0..255, or nil if not successful.
  #
  # The string may include a '#' prefix.
  def self.hex_to_rgb(hex_string)

    # 6-digit hex
    if hex_string =~ /^(#?)(\h\h)(\h\h)(\h\h)$/
      [$2, $3, $4].map { |h| h.to_i(16) }

    # 3-digit hex
    elsif hex_string =~ /^(#?)(\h)(\h)(\h)$/
      [$2, $3, $4].map { |h| (h*2).to_i(16) }

    else
      nil

    end
  end

  private

  def hexadecimal
    '%02x%02x%02x' % [ r, g, b ]
  end

end
