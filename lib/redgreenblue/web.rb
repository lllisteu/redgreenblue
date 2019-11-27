class RGB

  # Returns the object's RGB value in hexadecimal notation as used in CSS.
  #
  # Shortens to 3 digits when possible.
  def css_hex
    "##{hex true}"
  end

  alias css css_hex

end
