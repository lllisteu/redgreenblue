class RGB

  # Returns the color as a 24-bit integer in the range 0..16777215.
  def to_i
    ( r << 16 ) + ( g << 8 ) + b
  end

end
