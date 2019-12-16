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
  # Example: RGB.red.permutation returns [ RGB.red, RGB.green, RGB.blue ]
  # See also: shuffle
  def permutation
    values.permutation.to_a.uniq.map { |v| RGB.new v }
  end
end
