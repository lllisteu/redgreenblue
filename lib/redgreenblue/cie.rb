# Note: these CIE methods are experimental and will be changed or removed.

class RGB

  # Returns gamma-expanded (inverse-companded) RGB values for sRGB.
  #
  # Based on:
  # - https://en.wikipedia.org/wiki/SRGB
  # - http://www.brucelindbloom.com/Eqn_RGB_to_XYZ.html
  def expanded_srgb_values
    values.map { |v|
      if v <= 0.04045
        v / 12.92
      else
        ( ( v + 0.055 ) / 1.055 ) ** 2.4
      end
    }
  end

  # Returns CIE 1931 XYZ values for the RGB object.
  #
  # Based on:
  # - http://www.brucelindbloom.com/index.html?Eqn_RGB_to_XYZ.html
  # - https://en.wikipedia.org/wiki/CIE_1931_color_space
  # sRGB to XYZ matrix for D65 reference white by Bruce Lindbloom:
  # - http://www.brucelindbloom.com/index.html?Eqn_RGB_XYZ_Matrix.html
  def cie_xyz
    r, g, b = expanded_srgb_values
    [
      r * 0.4124564 + g * 0.3575761 + b * 0.1804375,
      r * 0.2126729 + g * 0.7151522 + b * 0.0721750,
      r * 0.0193339 + g * 0.1191920 + b * 0.9503041
    ].map { |v| v.round(6) }
  end

  alias xyz cie_xyz

  # Returns CIE 1931 xyY values for the RGB object.
  #
  # Based on:
  # - https://en.wikipedia.org/wiki/CIE_1931_color_space
  # - http://www.brucelindbloom.com/index.html?Eqn_XYZ_to_xyY.html
  # - https://ninedegreesbelow.com/photography/xyz-rgb.html
  def cie_xyy
    x, y, z = xyz
    [
      x / ( x + y + z ),
      y / ( x + y + z ),
      y
    ].map { |v| v.round(6) }
  end

  alias xyy cie_xyy

end
