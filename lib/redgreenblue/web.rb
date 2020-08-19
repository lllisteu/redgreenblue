class RGB

  #----------------------------------------------------------------------#
  #                            Class Methods                             #
  #----------------------------------------------------------------------#

  class << self

  end

  #----------------------------------------------------------------------#
  #                           Instance Methods                           #
  #----------------------------------------------------------------------#

  # Returns the object's RGB value in hexadecimal notation as used in CSS.
  #
  # Shortens to 3 digits when possible.
  def css_hex
    "##{hex true}"
  end

end
