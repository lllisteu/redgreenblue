require 'redgreenblue/hsx_shared'
require 'redgreenblue/math'

class RGB

  ########################################################################
  # Class methods                                                        #
  ########################################################################

  class << self

    # Creates a new RGB object from HSV values: hue (0..360), saturation (0..1), and value (0..1).
    #
    # ::hsb is an alias for ::hsv.
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

  # Returns the object's HSV-hue (0..360).
  #
  # #hsb_h is an alias for #hsv_h.
  def hsv_h
    hsv[0]
  end

  # Returns the object's HSV-saturation (0..1).
  #
  # #hsb_s is an alias for #hsv_s.
  def hsv_s
    hsv[1]
  end

  # Returns the object's HSV-value (0..1).
  #
  # #hsb_b is an alias for #hsv_v.
  def hsv_v
    hsv[2]
  end

  # Sets red, green, and blue using HSV values: hue (0..360), saturation (0..1), and value (0..1).
  #
  # #hsb= is an alias for #hsv=.
  def hsv=(*a)
    self.values = RGB.hsv_to_values(*a)
  end

  # Sets HSV-hue to a number of degrees (0..360) or nil.
  #
  # Adjusts red, green, and blue, leaving HSV-saturation and -value unchanged.
  # When hue is nil, saturation will be 0.
  #
  # #hsb_h= is an alias for #hsv_h=.
  def hsv_h=(degrees)
    self.hsv = hsv.fill(degrees,0,1)
  end

  # Sets HSV-saturation to a number between 0 and 1.
  #
  # Adjusts red, green, and blue, leaving HSV-hue and -value unchanged.
  # When saturation is 0, hue will be nil.
  #
  # #hsb_s= is an alias for #hsv_s=.
  def hsv_s=(value)
    self.hsv = hsv.fill(value  ,1,1)
  end

  # Sets HSV-value to a number between 0 and 1.
  #
  # Adjusts red, green, and blue, leaving HSV-hue and -saturation unchanged.
  # When value is 0, hue will be nil, and saturation will be 0.
  #
  # #hsb_b= is an alias for #hsv_v=.
  def hsv_v=(value)
    self.hsv = hsv.fill(value  ,2,1)
  end

  # Sets red, green, and blue by rotating the object's HSV-hue a number of degrees.
  #
  # #hsb_rotate! is an alias for #hsv_rotate!.
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