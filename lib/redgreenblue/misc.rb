class RGB::Color

  # Inverts the object's color.
  def invert!
    self.values = values.map { |v| 1 - v }
    self
  end

  # Creates a new RGB::Color with the inverted color of this RGB object.
  def invert
    dup.invert!
  end

  # Returns true when this is an achromatic color: red, green, and blue have equal values.
  # Otherwise false.
  def achromatic?
    values.min == values.max
  end

  # Returns an array of RGB::Colors for all possible ways in which the red, green, and blue values of this object can be exchanged.
  #
  # Example: RGB.red.permutation returns [ RGB.red, RGB.green, RGB.blue ].
  # See also: shuffle.
  def permutation
    values.permutation.to_a.uniq.map { |v| RGB::Color.new v }
  end

  # Returns an array of three RGB::Colors, for the red, green, and blue components of this object.
  def components
    [ RGB::Color.new(red,0,0), RGB::Color.new(0,green,0), RGB::Color.new(0,0,blue) ]
  end

  # Creates a new RGB::Color from three RGB::Colors representing the red, green, and blue components.
  def self.assemble(*a)
    v = a.flatten
    RGB::Color.new(v[0].red, v[1].green, v[2].blue)
  end

  # Returns the euclidean distance between this color and another color.
  #
  # When you imagine a color as a point in a 3-dimensional space,
  # the dimensions being red, green, and blue,
  # this is the distance between two colors.
  def distance(another)
    (
      ( (another.red   - red  ) ** 2) +
      ( (another.green - green) ** 2) +
      ( (another.blue  - blue ) ** 2)
    ) ** (1/2.0)
  end

end


module RGB

  class << self

  # Creates a new RGB::Color from three RGB::Colors representing the red, green, and blue components.
  def assemble(*a)
    Color.assemble(*a)
  end

  end

end
