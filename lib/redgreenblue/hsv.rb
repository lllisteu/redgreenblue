require 'redgreenblue/hsx_shared'
require 'redgreenblue/math'

class RGB

  ########################################################################
  # Class methods                                                        #
  ########################################################################

  class << self

    # Creates a new RGB object from HSV values: hue (0..360), saturation (0..1), and value (0..1).
    def hsv(*a)
      new hsv_to_values(*a)
    end

    # Calculates RGB values from HSV.
    # Given hue (0..360), saturation (0..1), and value (0..1),
    # returns red, green, and blue as three values between 0 and 1.
    def hsv_to_values(*a)
      hsm_to_values(:hsv, a)
    end

  end

  ########################################################################
  # Instance methods                                                     #
  ########################################################################

  # Returns color as HSV:
  # hue (0..360), saturation (0..1), value (0..1).
  # When saturation is 0, hue is nil.
  #
  # #hsb is an alias for #hsv.
  def hsv
    hsl_hsv_c[1]
  end

  # Sets red, green, and blue using HSV values: hue (0..360), saturation (0..1), and value (0..1).
  #
  # #hsb= is an alias for #hsv=.
  def hsv=(*a)
    self.values = RGB.hsv_to_values(*a)
  end

  # Sets red, green, and blue by rotating the object's HSV-hue a number of degrees.
  def hsv_rotate!(degrees)
    self.hsv = zip_add(hsv, [degrees, 0, 0])
    self
  end

  # Creates one or more new RGB objects by rotating this object's HSV-hue a number of degrees.
  #
  # #hsb_rotate is an alias for #hsv_rotate.
  def hsv_rotate(a_degrees, *b_degrees)
    if a_degrees.class != Array and b_degrees.none?
      RGB.hsv zip_add(hsv, [a_degrees, 0, 0])
    else
      ( [a_degrees] + b_degrees ).flatten.map { |degrees| RGB.hsv zip_add(hsv, [degrees, 0, 0]) }
    end
  end

end
