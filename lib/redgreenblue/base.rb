class RGB

  attr_reader :red, :green, :blue

  def initialize(v=[0.5, 0.5, 0.5])
    self.red, self.green, self.blue = v
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

  private

  # limit to 0..1
  def limit(n)
    n <= 0 ? 0.0 : n >= 1 ? 1.0 : n
  end

end
