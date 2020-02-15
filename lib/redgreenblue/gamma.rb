class RGB

  # Returns gamma-expanded (inverse-companded) RGB values for the object (three values between 0 and 1).
  #
  # Based on:
  # - https://en.wikipedia.org/wiki/SRGB
  # - http://www.brucelindbloom.com/Eqn_RGB_to_XYZ.html
  # - https://entropymine.com/imageworsener/srgbformula/
  def linear_values
    if color_space == 'sRGB'
      values.map { |v|
        if v <= 0.04045
          v / 12.92
        else
          ( ( v + 0.055 ) / 1.055 ) ** 2.4
        end
      }
    else
      raise "can not compute gamma for color space '#{color_space}'"
    end
  end

  # Sets the object's RGB values using three linear RGB values, each between 0 and 1.
  # Linear values will be converted (gamma-companded) to the object's gamma.
  #
  # Based on:
  # - https://en.wikipedia.org/wiki/SRGB
  # - http://www.brucelindbloom.com/Eqn_XYZ_to_RGB.html
  # - https://entropymine.com/imageworsener/srgbformula/
  def linear_values=(*a)
    if color_space == 'sRGB'
      self.values = a.flatten.map { |v|
        if v <= 0.0031308
          v * 12.92
        else
          1.055 * ( v ** ( 1/2.4 ) ) - 0.055
        end
      }.map { |v| v.round(9) }
    else
      raise "can not compute gamma for color space '#{color_space}'"
    end
  end

end
