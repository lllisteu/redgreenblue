class RGB::Color

  # Matches this color to a set of colors by calculating their euclidean distance.
  #
  # Returns the given set of colors with their distance from this color, sorted by distance (nearest color first).
  # @example What is nearer: red, grey or white?
  #  RGB.hex('f9c').match_distance [RGB.red, RGB.grey, RGB.white]
  def match_distance(others)
    others.map { |c| [ c, distance(c) ] }.sort_by { |a| a[1] }
  end

  # Matches this color to a set of colors using the CIE 1976 delta E formula.
  #
  # Returns the given set of colors with their difference from this color, sorted by difference (nearest color first).
  # @example Find the 3 nearest CSS named colors
  #  RGB.hex('f9c').match_de76(RGB.css).first(3)
  def match_de76(others)
    others.map { |c| [ c, de76(c) ] }.sort_by { |a| a[1] }
  end

  # Matches this (reference) color to a set of colors using the CIE 1994 delta E formula.
  #
  # Returns the given set of colors with their difference from this color, sorted by difference (nearest color first).
  #
  # By default uses parameters for use in graphic arts, and reference conditions.
  # Parameters (k1, k2, kl, kc, kh) can be individually overriden for different applications and for variations in conditions.
  def match_de94(others, k1: 0.045, k2: 0.015, kl: 1, kc: 1, kh: 1)
    others.map { |c| [ c, de94(c, k1: k1, k2: k2, kl: kl, kc: kc, kh: kh) ] }.sort_by { |a| a[1] }
  end

  # Matches this (reference) color to a set of colors using the CIE 1994 delta E formula.
  #
  # For use in graphic arts, under reference conditions.
  #
  # Returns the given set of colors with their difference from this color, sorted by difference (nearest color first).
  def match_de94g(others)
    others.map { |c| [ c, de94g(c) ] }.sort_by { |a| a[1] }
  end

  # Matches this (reference) color to a set of colors using the CIE 1994 delta E formula.
  #
  # For use with textiles, under reference conditions.
  #
  # Returns the given set of colors with their difference from this color, sorted by difference (nearest color first).
  def match_de94t(others)
    others.map { |c| [ c, de94t(c) ] }.sort_by { |a| a[1] }
  end

end
