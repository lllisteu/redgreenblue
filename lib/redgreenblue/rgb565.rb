class RGB::Color

  # Returns the color in 16-bit RGB565 format.
  def rgb565
    [((r >> 3) << 11) + ((g >> 2) << 5) + (b >> 3)].pack 'S<'
  end

  # Sets the color from 16-bit RGB565 data.
  # With help from:
  # - https://stackoverflow.com/questions/2442576/
  def rgb565=(rgb565_string)
    v = ( rgb565_string.unpack "S<" )[0]
    self.r = ( ( v & 0xf800 ) >> 11 ) << 3
    self.g = ( ( v & 0x07e0 ) >>  5 ) << 2
    self.b = ( ( v & 0x001f )       ) << 3
  end

  # Creates a new RGB::Color from 16-bit RGB565 data.
  def self.rgb565(rgb565_string)
    c = self.new
    c.rgb565 = rgb565_string
    c
  end

end

#----------------------------------------------------------------------#
#                            Module Methods                            #
#----------------------------------------------------------------------#

module RGB

  class << self

    # Creates a new RGB::Color from 16-bit RGB565 data.
    def rgb565(rgb565_string)
      Color.rgb565(rgb565_string)
    end

  end

end
