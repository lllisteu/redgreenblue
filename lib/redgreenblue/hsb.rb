require 'redgreenblue/hsv'

class RGB

  #----------------------------------------------------------------------#
  #                            Class Methods                             #
  #----------------------------------------------------------------------#

  class << self

    # Creates a new RGB object from HSB values: hue (0..360), saturation (0..1), and brightness (0..1).
    alias hsb hsv

  end

  #----------------------------------------------------------------------#
  #                           Instance Methods                           #
  #----------------------------------------------------------------------#

  # Returns color as HSB:
  # hue (0..360), saturation (0..1), brightness (0..1).
  # When saturation is 0, hue is nil.
  alias hsb         hsv

  # Returns the object's HSB-hue (0..360).
  alias hsb_h       hsv_h

  # Returns the object's HSB-saturation (0..1).
  alias hsb_s       hsv_s

  # Returns the object's HSB-brightness (0..1).
  alias hsb_b       hsv_v

  # Sets red, green, and blue using HSB values: hue (0..360), saturation (0..1), and brightness (0..1).
  alias hsb=        hsv=

  # Sets HSB-hue to a number of degrees (0..360) or nil.
  #
  # Adjusts red, green, and blue, leaving HSB-saturation and -brightness unchanged.
  # When hue is nil, saturation will be 0.
  alias hsb_h=      hsv_h=

  # Sets HSB-saturation to a number between 0 and 1.
  #
  # Adjusts red, green, and blue, leaving HSB-hue and -brightness unchanged.
  # When saturation is 0, hue will be nil.
  alias hsb_s=      hsv_s=

  # Sets HSB-brightness to a number between 0 and 1.
  #
  # Adjusts red, green, and blue, leaving HSB-hue and -saturation unchanged.
  # When brightness is 0, hue will be nil, and saturation will be 0.
  alias hsb_b=      hsv_v=

  # Sets red, green, and blue by rotating the object's HSB-hue a number of degrees.
  alias hsb_rotate! hsv_rotate!

  # Creates one or more new RGB objects by rotating this object's HSB-hue a number of degrees.
  alias hsb_rotate  hsv_rotate

end
