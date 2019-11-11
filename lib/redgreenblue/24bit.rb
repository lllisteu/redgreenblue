class RGB

# r, g, b methods

  # Returns the red component as an integer in the range 0..255 (an 8-bit value).
  def r
    (red   * 255).round
  end

  # Returns the green component as an integer in the range 0..255 (an 8-bit value).
  def g
    (green * 255).round
  end

  # Returns the blue component as an integer in the range 0..255 (an 8-bit value).
  def b
    (blue  * 255).round
  end

  # Sets the red component using an integer in the range 0..255 (an 8-bit value).
  def r=(n)
    self.red   = n / 255.0
  end

  # Sets the green component using an integer in the range 0..255 (an 8-bit value).
  def g=(n)
    self.green = n / 255.0
  end

  # Sets the blue component using an integer in the range 0..255 (an 8-bit value).
  def b=(n)
    self.blue  = n / 255.0
  end

# rgb methods

  # Returns the red, green, and blue components as integers in the range 0..255 (three 8-bit values).
  def rgb
    [r,g,b]
  end

  # Sets the red, green, and blue components using three integers in the range 0..255 (three 8-bit values).
  def rgb=(*rgb)
    self.r, self.g, self.b = rgb.flatten
  end

  # Creates a new object from red, green, and blue components as integers in the range 0..255 (three 8-bit values).
  def self.rgb(*rgb)
    c = self.new
    c.rgb = rgb
    c
  end

end
