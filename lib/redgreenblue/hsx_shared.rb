class RGB::Color

  class << self

    private

    # Calculates RGB values from HSL or HSV.
    # With help from:
    # - https://en.wikipedia.org/wiki/HSL_and_HSV
    def hsm_to_values(type, *a)
      raise NotImplementedError unless [:hsl, :hsv].include? type

      hue, saturation, magnitude = a.flatten

      if ( saturation == 0 ) or ( ! hue )
        return Array.new(3) { magnitude }
      end

      hue = hue.modulo 360

      chroma = case type
        when :hsl
          ( 1 - ( 2 * magnitude - 1 ).abs ) * saturation
        when :hsv
          magnitude * saturation
      end

      values = [
        chroma,
        ( 1 - ( ( hue / 60.0 ).modulo(2) - 1 ).abs ) * chroma,
        0
      ]

      values = case type
        when :hsl
          values.map { |v| ( v + magnitude - chroma / 2.0 ).round(9) }
        when :hsv
          values.map { |v| ( v + magnitude - chroma       ).round(9) }
      end

      # order values according to hue sextant
      [ [0,1,2], [1,0,2], [2,0,1], [2,1,0], [1,2,0], [0,2,1] ][hue.div 60].map { |i| values[i]}
    end

  end

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
        ( case sorted_hash.keys.first
          when :red
            60 * ( ( ( green - blue  ) / chroma ).modulo 6 )
          when :green
            60 * ( (   blue  - red   ) / chroma + 2 )
          when :blue
            60 * ( (   red   - green ) / chroma + 4 )
          end
        ).round(6)
      end

    lightness = ( min + max ) / 2.0

    saturation_hsl =
      chroma == 0 ? 0.0 : ( chroma / ( 1 - (2 * lightness - 1).abs ) ).round(9)

    value = max

    saturation_hsv =
      value == 0 ? 0.0 : chroma / value

    [ [hue, saturation_hsl, lightness], [hue, saturation_hsv, value], chroma ]
  end

end
