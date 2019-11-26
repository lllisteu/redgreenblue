class RGB

  # Changes the object's color by mixing it with a portion of another RGB color.
  def mix!(another,portion=0.5)
    self.values = mix_values(another.values, portion)
    self
  end

  # Creates a new RGB object by mixing this object's color with a portion of another RGB color.
  def mix(another,portion=0.5)
    RGB.new mix_values(another.values, portion)
  end

  # Changes the object's color by mixing it with a portion of white.
  def whiten!(portion=0.5)
    mix!(RGB.white, portion)
  end

  # Creates a new RGB object by mixing this object's color with a portion of white.
  def whiten(portion=0.5)
    mix(RGB.white, portion)
  end

  # Changes the object's color by mixing it with a portion of black.
  def blacken!(portion=0.5)
    mix!(RGB.black, portion)
  end

  # Creates a new RGB object by mixing this object's color with a portion of black.
  def blacken(portion=0.5)
    mix(RGB.black, portion)
  end

  private

  def mix_values(some_values, portion)
    raise(ArgumentError, "Portion '#{portion}' not in range (0..1)") unless (0..1).include? portion
    [
      ( red   * (1 - portion) ) + ( some_values[0] * portion ),
      ( green * (1 - portion) ) + ( some_values[1] * portion ),
      ( blue  * (1 - portion) ) + ( some_values[2] * portion )
    ]
  end
end
