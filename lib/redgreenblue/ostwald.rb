class RGB

  # Returns a new RGB object with this color's Ostwald full-color,
  # or nil for achromatic colors (white, greys, and black).
  #
  # The resulting color contains no white or black,
  # i.e. it has at least one RGB component set to 0, and at least one set to maximum.
  #
  # This is identical (barring very small rounding errors)
  # to setting HSL-saturation to 1, and -lightness to 0.5
  #
  # Based on:
  # - Color for the Sciences, pp. 575–591
  # - https://lirias.kuleuven.be/retrieve/306124 (PDF)
  def ostwald_color
    white_portion = values.min
    color_portion = values.max - white_portion

    if color_portion == 0
      nil
    else
      RGB.new( values.map { |v| ( ( v - white_portion ) / color_portion ).round(6) } )
    end
  end

  # Returns the portions of Ostwald full-color, white, and black, which constitute this color.
  #
  # The sum of these three numbers equals 1.
  #
  # #cwk is an alias for #ostwald_cwk.
  #
  # Based on:
  # - Color for the Sciences, pp. 575–591
  # - https://lirias.kuleuven.be/retrieve/306124 (PDF)
  def ostwald_cwk(round: true)
    [
      color_portion = values.max - values.min,
      white_portion = values.min,
      1 - color_portion - white_portion
    ].map { |v| round ? v.round(8) : v }
  end

  alias cwk ostwald_cwk

end
