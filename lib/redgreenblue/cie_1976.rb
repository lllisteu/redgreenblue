class RGB

  # Returns CIE 1976 L*a*b* (CIELAB) values for the RGB object.
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
