class RGB

  # Returns the color as a 24-bit integer in the range 0..16777215.
  def to_i
    ( r << 16 ) + ( g << 8 ) + b
  end

  # Creates a new RGB object from a 24-bit integer in the range 0..16777215.
  def self.at(number)
    if (0..16777215) === number.to_i
      RGB.hex( '%06x' % number.to_i )
    else
      raise ArgumentError, "Argument '#{number}' not in range 0..16777215"
    end
  end

end
