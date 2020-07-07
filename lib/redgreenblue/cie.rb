class RGB

  # Returns CIE 1931 XYZ values for the RGB object.
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

  # Returns CIE 1931 xyY values for the RGB object.
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

  # Returns CIE 1931 xy values for the RGB object.
  def cie_xy
    cie_xyy[0..1]
  end

  alias xy cie_xy

  # Returns L*a*b* (CIELAB) values for the RGB object.
  #
  # Based on:
  # - http://www.brucelindbloom.com/Eqn_XYZ_to_Lab.html
  # - https://en.wikipedia.org/wiki/CIELAB_color_space
  # With peeking at:
  # - https://github.com/halostatue/color/blob/master/lib/color/rgb.rb
  def cie_lab(round: true)
    f = cie_xyz(round: false).zip(RGB.white.cie_xyz(round: false)).map {
      |a| a[0] / a[1]
    }.map { |v|
      if v > ( 216.0 / 24389 )
        v ** ( 1.0 / 3 ) # cube root
      else
        ( 24389.0 / 27 * v + 16 ) / 116.0
      end
    }

    [

      116 *  f[1] - 16,
      500 * (f[0] - f[1]),
      200 * (f[1] - f[2])

    ].map { |v| round ? v.round(8) : v }
  end

  alias lab cie_lab

end
