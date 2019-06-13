class RGB

  # Mix with second RGB color.
  # p denotes portion of the mixed-in color to be used.
  # p=0 delivers pure original color (no change),
  # p=1 delivers pure mixed-in color.
  def mix(color,p=0.5)
    raise(ArgumentError, "Portion '#{p}' not in range (0..1)") unless (0..1).include? p

    RGB.new([
      ( red   * (1-p) ) + ( color.red   * p ),
      ( green * (1-p) ) + ( color.green * p ),
      ( blue  * (1-p) ) + ( color.blue  * p )
    ])
  end

  def invert!
    self.red, self.green, self.blue = 1-red, 1-green, 1-blue
    self
  end

  def invert
    dup.invert!
  end

end
