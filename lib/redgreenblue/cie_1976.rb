class RGB

  # Returns CIE 1976 L*a*b* (CIELAB) values for the RGB object.
  def cie_lab(round: true)
    cie_lab_luv(round: round, type: :lab)
  end

  alias lab cie_lab

  # Returns CIE 1976 L*u*v* (CIELUV) values for the RGB object.
  def cie_luv(round: true)
    cie_lab_luv(round: round, type: :luv)
  end

  alias luv cie_luv

  # Returns the object's color distance from another RGB object, according to the CIE 1976 delta E formula.
  #
  # Based on:
  # - http://www.brucelindbloom.com/Eqn_DeltaE_CIE76.html
  # - https://en.wikipedia.org/wiki/Color_difference
  def delta_e_cie_1976(another)
    l , a , b  =         cie_lab(round: false)
    l2, a2, b2 = another.cie_lab(round: false)

    Math.sqrt( (l - l2) ** 2 + (a - a2) ** 2 + (b - b2) ** 2 ).round(8)
  end

  alias d76 delta_e_cie_1976

  private

  # Returns either CIE 1976 L*a*b* (CIELAB) or CIE 1976 L*u*v* (CIELUV) values for the RGB object.
  #
  # L*a*b* formula based on:
  # - http://www.brucelindbloom.com/Eqn_XYZ_to_Lab.html
  # - https://en.wikipedia.org/wiki/CIELAB_color_space
  # With peeking at:
  # - https://github.com/halostatue/color/blob/master/lib/color/rgb.rb
  #
  # L*u*v* formula based on:
  # - http://www.brucelindbloom.com/Eqn_XYZ_to_Luv.html
  # - https://en.wikipedia.org/wiki/CIELUV
  def cie_lab_luv(round: true, type: :lab)
    x , y , z  =           cie_xyz(round: false)
    xr, yr, zr = RGB.white.cie_xyz(round: false)

    f = [ x / xr, y / yr, z / zr ].map { |v|
      if v > ( 216.0 / 24389 )
        v ** ( 1.0 / 3 ) # cube root
      else
        ( 24389.0 / 27 * v + 16 ) / 116.0
      end
    }

    if type == :luv
      [
        l = 116 * f[1] - 16,
        13 * l * ( ( 4 * x ) / ( x + 15 * y + 3 * z ) - ( 4 * xr ) / ( xr + 15 * yr + 3 * zr ) ),
        13 * l * ( ( 9 * y ) / ( x + 15 * y + 3 * z ) - ( 9 * yr ) / ( xr + 15 * yr + 3 * zr ) )
      ]
    else
      [
        116 *  f[1] - 16,
        500 * (f[0] - f[1]),
        200 * (f[1] - f[2])
      ]
    end.map { |v| v.nan? ? 0.0 : ( round ? v.round(8) : v ) }
  end

end
