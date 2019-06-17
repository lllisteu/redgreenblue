class RGB

# Mix

  # Mix with second RGB color.
  # p denotes portion of the mixed-in color to be used.
  # p=0 delivers pure original color (no change),
  # p=1 delivers pure mixed-in color.

  def mix!(color,p=0.5)
    self.values = mix_values(color.values, p)
    self
  end

  def mix(color,p=0.5)
    RGB.new mix_values(color.values, p)
  end

# Invert

  def invert!
    self.values = values.map { |v| 1-v }
    self
  end

  def invert
    dup.invert!
  end

# Mix with white

  def whiten!(p)
    mix!(RGB.white, p)
  end

  def whiten(p)
    mix(RGB.white, p)
  end

# Mix with black

  def blacken!(p)
    mix!(RGB.black, p)
  end

  def blacken(p)
    mix(RGB.black, p)
  end

  private

  def mix_values(v, p)
    raise(ArgumentError, "Portion '#{p}' not in range (0..1)") unless (0..1).include? p
    [
      ( red   * (1-p) ) + ( v[0] * p ),
      ( green * (1-p) ) + ( v[1] * p ),
      ( blue  * (1-p) ) + ( v[2] * p )
    ]
  end
end
