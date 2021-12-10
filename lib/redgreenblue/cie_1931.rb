class RGB::Color

  # Returns CIE 1931 XYZ values for the RGB::Color object.
  #
  # Based on:
  # - http://www.brucelindbloom.com/index.html?Eqn_RGB_to_XYZ.html
  # - https://en.wikipedia.org/wiki/CIE_1931_color_space
  # sRGB to XYZ matrix for D65 reference white calculated with Javascript by Bruce Lindbloom:
  # - http://www.brucelindbloom.com/ColorCalculator.html
  def cie_xyz(round: true)
    r, g, b = linear_values

    [

      r * 0.4124_5643_9090 + g * 0.3575_7607_7644 + b * 0.1804_3748_3266,
      r * 0.2126_7285_1406 + g * 0.7151_5215_5288 + b * 0.0721_7499_3307,
      r * 0.0193_3389_5582 + g * 0.1191_9202_5881 + b * 0.9503_0407_8536

    ].map { |v| round ? v.round(8) : v }
  end

  alias xyz cie_xyz

  # Returns CIE 1931 xyY values for the RGB::Color object.
  #
  # Based on:
  # - https://en.wikipedia.org/wiki/CIE_1931_color_space
  # - http://www.brucelindbloom.com/index.html?Eqn_XYZ_to_xyY.html
  # - https://ninedegreesbelow.com/photography/xyz-rgb.html
  def cie_xyy
    x, y, z = cie_xyz(round: false)

    [

      x / ( x + y + z ),
      y / ( x + y + z ),
      y

    ].map { |v| v.round(8) }
  end

  alias xyy cie_xyy

  # Returns CIE 1931 xy values for the RGB::Color object.
  def cie_xy
    cie_xyy[0..1]
  end

  alias xy cie_xy

end
