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

  # Returns a set of colors between this color and another. That other color is included.
  #
  # The resulting colors are spaced evenly in the RGB color space using a straightforward calculation.
  # You will likely experience these colors as not exactly evenly spaced.
  def steps(another,step_count=1)
    (1..step_count-1).map { |c| mix(another, c.to_f/step_count) }.push another.dup
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
