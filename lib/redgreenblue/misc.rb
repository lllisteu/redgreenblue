class RGB

  # Inverts the object's color.
  def invert!
    self.values = values.map { |v| 1 - v }
    self
  end

  # Creates a new RGB object with the inverted color of this RGB object.
  def invert
    dup.invert!
  end

  # Returns an array of RGB objects for all possible ways in which the red, green, and blue values of this object can be exchanged.
  #
  # Example: RGB.red.permutation returns [ RGB.red, RGB.green, RGB.blue ].
  # See also: shuffle.
  def permutation
    values.permutation.to_a.uniq.map { |v| RGB.new v }
  end

  # Returns an array of three RGB objects, for the red, green, and blue components of this object.
  def components
    [ RGB.new(red,0,0), RGB.new(0,green,0), RGB.new(0,0,blue) ]
  end

  # Creates a new RGB object from three RGB objects representing the red, green, and blue components.
  def self.assemble(*a)
    v = a.flatten
    RGB.new(v[0].red, v[1].green, v[2].blue)
  end

end
