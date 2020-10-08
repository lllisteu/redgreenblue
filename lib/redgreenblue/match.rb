class RGB

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

end
