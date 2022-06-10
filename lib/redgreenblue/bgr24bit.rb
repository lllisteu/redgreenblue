class RGB::Color

  # Returns a 3-byte string containing the object's color in BGR24 format.
  def bgr24
    [b, g, r].pack('C3')
  end

  # Sets red, green, and blue using BGR24 data (a 3-byte string).
  def bgr24=(bgr_string)
    self.b, self.g, self.r = bgr_string.unpack('C3')
  end

  # Creates a new RGB::Color from BGR24 data (a 3-byte string).
  def self.bgr24(bgr)
    c = self.new
    c.bgr24 = bgr
    c
  end

end


module RGB

  class << self

    # Creates a new RGB::Color from BGR24 data (a 3-byte string).
    def bgr24(bgr)
      Color.bgr24(bgr)
    end

  end

end
