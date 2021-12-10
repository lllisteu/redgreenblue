class RGB::Color

  # Returns the difference between this (reference) color and another color, according to the CIE 1994 delta E formula.
  #
  # By default uses parameters for use in graphic arts, and reference conditions.
  # Parameters (k1, k2, kl, kc, kh) can be individually overriden for different applications and for variations in conditions.
  #
  # Based on:
  # - http://www.brucelindbloom.com/Eqn_DeltaE_CIE94.html
  # - https://archive.org/details/gov.law.cie.15.2004
  # - https://en.wikipedia.org/wiki/Color_difference
  def delta_e_cie_1994(another, k1: 0.045, k2: 0.015, kl: 1, kc: 1, kh: 1)

    l , a , b  =         cie_lab(round: false)
    l2, a2, b2 = another.cie_lab(round: false)

    c  = Math.hypot(a , b )
    c2 = Math.hypot(a2, b2)

    da = a - a2
    db = b - b2
    dc = c - c2

    dh2 = (da ** 2) + (db ** 2) - (dc ** 2)
    dl = l - l2

    sl = 1
    sc = 1 + k1 * c
    sh = 1 + k2 * c

    Math.sqrt(
      ( (dl  / ( kl*sl)) ** 2  ) +
      ( (dc  / ( kc*sc)) ** 2  ) +
      (  dh2 / ((kh*sh)  ** 2) )
    ).round(6)

  end

  alias de94 delta_e_cie_1994

  # Returns the difference between this (reference) color and another color, according to the CIE 1994 delta E formula.
  #
  # For use in graphic arts, under reference conditions.
  def de94g(another)
    delta_e_cie_1994(another)
  end

  # Returns the difference between this (reference) color and another color, according to the CIE 1994 delta E formula.
  #
  # For use with textiles, under reference conditions.
  def de94t(another)
    delta_e_cie_1994(another, k1: 0.048, k2: 0.014, kl: 2)
  end

end
