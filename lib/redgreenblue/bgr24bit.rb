class RGB

# bgr 24-bit methods (as used by BMP bitmaps)

  def bgr24
    [b, g, r].pack('C3')
  end

  def bgr24=(s)
    self.b, self.g, self.r = s.unpack('C3')
  end

  # factory method
  def self.bgr24(bgr)
    c = self.new
    c.bgr24 = bgr
    c
  end

end