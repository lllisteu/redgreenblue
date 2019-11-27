class RGB

  def initialize(*a)
    self.values = a.any? ? a : [ 0.5, 0.5, 0.5 ]
  end

  # Returns the red component as a value between 0 and 1.
  def red
    @red
  end

  # Returns the green component as a value between 0 and 1.
  def green
    @green
  end

  # Returns the blue component as a value between 0 and 1.
  def blue
    @blue
  end

  # Sets the red component to a value between 0 and 1.
  #
  # Values outside the range 0..1 will be clipped.
  def red=(value)
    @red = limit(value)
  end

  # Sets the green component to a value between 0 and 1.
  #
  # Values outside the range 0..1 will be clipped.
  def green=(value)
    @green = limit(value)
  end

  # Sets the blue component to a value between 0 and 1.
  #
  # Values outside the range 0..1 will be clipped.
  def blue=(value)
    @blue = limit(value)
  end

  # Returns the red, green, and blue components as three values between 0 and 1.
  def values
    [ red, green, blue ]
  end

  alias to_a values

  # Sets the red, green, and blue components using three values between 0 and 1.
  #
  # Values outside the range 0..1 will be clipped.
  def values=(*a)
    self.red, self.green, self.blue = a.flatten
  end

  # Returns true if this object and another object represent exactly the same color. Otherwise returns false.
  def ==(other)
    ( self.class == other.class ) && ( self.values == other.values )
  end

  # Returns a sorted hash of 3 key/value pairs for red, green and blue,
  # sorted in order of decreasing value.
  def to_h
    ([:red, :green, :blue].zip values).sort_by {
      |k,v| [-v,[:red, :green, :blue].index(k)]
    }.to_h
  end

  private

  # limits to range 0..1
  def limit(n)
    n <= 0 ? 0.0 : n >= 1 ? 1.0 : n
  end

end
