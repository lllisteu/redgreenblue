class RGB

  def mix!(color,p=0.5)
    self.values = mix_values(color.values, p)
    self
  end

  def mix(color,p=0.5)
    RGB.new mix_values(color.values, p)
  end

  def whiten!(p)
    mix!(RGB.white, p)
  end

  def whiten(p)
    mix(RGB.white, p)
  end

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
