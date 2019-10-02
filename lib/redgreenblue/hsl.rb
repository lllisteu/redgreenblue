class RGB

  # https://en.wikipedia.org/wiki/HSL_and_HSV#Hue_and_chroma
  def hue
    if chroma == 0.0
      nil
    else
      case to_h.keys.first
      when :red
        60 * ( ( ( green - blue  ) / chroma ).modulo 6 )
      when :green
        60 * ( (   blue  - red   ) / chroma + 2 )
      when :blue
        60 * ( (   red   - green ) / chroma + 4 )
      end
    end
  end

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
