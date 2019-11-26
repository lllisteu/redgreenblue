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

end
