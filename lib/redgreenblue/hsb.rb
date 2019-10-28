class RGB

  # Hue, saturation, brightness or value
  # https://en.wikipedia.org/wiki/HSL_and_HSV
  def hsb
    v = values.max
    [ hue, (v == 0 ? 0 : chroma/v), v ]
  end

end
