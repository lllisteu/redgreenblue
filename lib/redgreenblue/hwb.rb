class RGB::Color

  # Returns the color's hue (0..360), whiteness (0..1), and blackness (0..1), as defined by the HWB color model.
  #
  # For achromatic colors, hue is nil.
  #
  # Based on:
  # - http://alvyray.com/Papers/CG/HWB_JGTv208.pdf (PDF)
  # - https://en.wikipedia.org/wiki/HWB_color_model
  def hwb
    [ hsv_h, cwk[1,2] ].flatten
  end

end
