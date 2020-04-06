require 'redgreenblue/hsx_shared'
require 'redgreenblue/math'

class RGB

  ########################################################################
  # Class methods                                                        #
  ########################################################################

  class << self

    # Creates a new RGB object from HSL values: hue (0..360), saturation (0..1), and lightness (0..1).
    def hsl(*a)
      new hsl_to_values(*a)
    end

    # Calculates RGB values from HSL.
    # Given hue (0..360), saturation (0..1), and lightness (0..1),
    # returns red, green, and blue as three values between 0 and 1.
    def hsl_to_values(*a)
      hsm_to_values(:hsl, a)
    end

  end

  ########################################################################
  # Instance methods                                                     #
  ########################################################################

  # Returns color as HSL:
  # hue (0..360), saturation (0..1), lightness (0..1).
  # When saturation is 0, hue is nil.
  def hsl
    hsl_hsv_c[0]
  end

  # Returns the object's HSL-hue (0..360).
  def hsl_hue
    hsl[0]
  end

  # Returns the object's HSL-saturation (0..1).
  def hsl_saturation
    hsl[1]
  end

  # Returns the object's HSL-lightness (0..1).
  def hsl_lightness
    hsl[2]
  end

  # Sets red, green, and blue using HSL values: hue (0..360), saturation (0..1), and lightness (0..1).
  def hsl=(*a)
    self.values = RGB.hsl_to_values(*a)
  end

  # Sets red, green, and blue by rotating the object's HSL-hue a number of degrees.
  def hsl_rotate!(degrees)
    self.hsl = zip_add(hsl, [degrees, 0, 0])
    self
  end

  # Creates one or more new RGB objects by rotating this object's HSL-hue a number of degrees.
  def hsl_rotate(a_degrees, *b_degrees)
    if a_degrees.class != Array and b_degrees.none?
      RGB.hsl zip_add(hsl, [a_degrees, 0, 0])
    else
      ( [a_degrees] + b_degrees ).flatten.map { |degrees| RGB.hsl zip_add(hsl, [degrees, 0, 0]) }
    end
  end

end
