class RGB

  # Hue, saturation, brightness
  def hsb
    v = values.max
    [ hue, (v == 0 ? 0 : chroma/v), v ]
  end

end
