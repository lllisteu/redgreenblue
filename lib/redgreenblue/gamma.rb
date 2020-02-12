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
      raise "Can not compute gamma for color space #{color_space}"
    end
  end

end
