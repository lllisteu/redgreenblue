class RGB

  attr_reader :red, :green, :blue

  def initialize(*a)
    self.values = a.any? ? a : [ 0.5, 0.5, 0.5 ]
  end

  def red=(n)
    @red = limit(n)
  end

  def green=(n)
    @green = limit(n)
  end

  def blue=(n)
    @blue = limit(n)
  end

  def values
    [ red, green, blue ]
  end

  alias to_a values

  def values=(*a)
    self.red, self.green, self.blue = a.flatten
  end

  # Returns true if this object and an other object represent exactly the same color. Otherwise returns false.
  def ==(other)
    ( self.class == other.class ) && ( self.values == other.values )
  end

  # Returns a sorted hash of 3 key/value pairs
  # for red, green and blue,
  # sorted in order of decreasing value
  def to_h
    ([:red, :green, :blue].zip values).sort_by {
      |k,v| [-v,[:red, :green, :blue].index(k)]
    }.to_h
  end

  private

  # limit to 0..1
  def limit(n)
    n <= 0 ? 0.0 : n >= 1 ? 1.0 : n
  end

end
