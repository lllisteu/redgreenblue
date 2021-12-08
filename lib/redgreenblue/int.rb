class RGB::Color

  # Returns the color as a 24-bit integer in the range 0..16777215.
  def to_i
    ( r << 16 ) + ( g << 8 ) + b
  end

  # Creates a new RGB::Color object from a 24-bit integer in the range 0..16777215.
  def self.at(number)
    n = number.to_i
    if (0..16777215) === n
      rgb(
        ( n & 0xff0000 ) >> 16,
        ( n & 0x00ff00 ) >>  8,
        ( n & 0x0000ff )
      )
    else
      raise ArgumentError, "Argument '#{number}' not in range 0..16777215"
    end
  end

end

#----------------------------------------------------------------------#
#                            Module Methods                            #
#----------------------------------------------------------------------#

module RGB

  class << self

    # Creates a new RGB::Color object from a 24-bit integer in the range 0..16777215.
    def at(number)
      Color.at(number)
    end

  end

end
