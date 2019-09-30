class RGB

  # Lightness as the average of the min and max of RGB values.
  # https://en.wikipedia.org/wiki/HSL_and_HSV#Lightness
  def lightness
    ( values.min + values.max ) / 2.0
  end

  # Chroma: colorfulness as difference from a grey of the same lightness.
  # https://en.wikipedia.org/wiki/Colorfulness
  # https://en.wikipedia.org/wiki/HSL_and_HSV#Hue_and_chroma
  def chroma
    values.max - values.min
  end

end
