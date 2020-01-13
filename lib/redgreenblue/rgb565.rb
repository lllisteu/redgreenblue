class RGB

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

  # Deprecated: this method will be removed in a future version.
  # Returns the color in 16-bit RGB565 format as a string of 0's and 1's.
  def rgb565_binary
    unless defined? @@warned_rgb565_binary_deprecation
      warn "Warning: 'rgb565_binary' has been deprecated and will be removed in a future version of redgreenblue."
      @@warned_rgb565_binary_deprecation = true
    end
    rgb565.bytes.reverse.map { |b| "%08b" % b }.join
  end

  # Creates a new RGB color from 16-bit RGB565 data.
  def self.rgb565(rgb565_string)
    c = self.new
    c.rgb565 = rgb565_string
    c
  end

end
