class RGB

  # Returns color as HSL:
  # hue (0..360), saturation (0..1), lightness (0..1)
  def hsl
    hsl_hsv_c[0]
  end

  # Returns color as HSV:
  # hue (0..360), saturation (0..1), value (0..1)
  def hsv
    hsl_hsv_c[1]
  end

  alias hsb hsv

  private

  # Compute HSL, HSV, and chroma.
  # With help from:
  # - https://en.wikipedia.org/wiki/HSL_and_HSV
  def hsl_hsv_c
    sorted_hash = to_h
    min, max = sorted_hash.values.values_at(2,0)

    chroma = max - min

    hue =
      if chroma == 0
        nil
      else
        case sorted_hash.keys.first
        when :red
          60 * ( ( ( green - blue  ) / chroma ).modulo 6 )
        when :green
          60 * ( (   blue  - red   ) / chroma + 2 )
        when :blue
          60 * ( (   red   - green ) / chroma + 4 )
        end
      end

    lightness = ( min + max ) / 2.0

    saturation_hsl =
      chroma == 0 ? 0.0 : ( chroma / ( 1 - (2 * lightness - 1).abs ) ).round(9)

    value = max

    saturation_hsv =
      value  == 0 ? 0.0 : chroma / value

    [ [hue, saturation_hsl, lightness], [hue, saturation_hsv, value], chroma ]
  end

end
