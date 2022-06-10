class RGB::Color

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

  # Creates a new RGB::Color from red, green, and blue components as integers in the range 0..255 (three 8-bit values).
  def self.rgb(*rgb)
    c = self.new
    c.rgb = rgb
    c
  end

  # Sets the red, green, and blue values to those of the nearest 24-bit color.
  def snap!
    self.rgb = rgb
    self
  end

  # Creates a new RGB::Color containing the nearest 24-bit color.
  def snap
    RGB.rgb rgb
  end

end


module RGB

  class << self

    # Creates a new RGB::Color from red, green, and blue components as integers in the range 0..255 (three 8-bit values).
    def rgb(*rgb)
      Color.rgb(*rgb)
    end

    # Calls the given block for each 24-bit RGB color (from black to white), passing the color as an RGB::Color object.
    #
    # Returns the number of iterations.
    def each_24bit_color
      range = 0..255
      range.each do |r|
        range.each do |g|
          range.each do |b|
            yield self.rgb(r,g,b)
          end
        end
      end
      range.size ** 3
    end

  end

end
