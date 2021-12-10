require 'redgreenblue/hsx_shared'
require 'redgreenblue/math'

class RGB::Color

  #----------------------------------------------------------------------#
  #                            Class Methods                             #
  #----------------------------------------------------------------------#

  class << self

    # Creates a new RGB::Color object from HSL values: hue (0..360), saturation (0..1), and lightness (0..1).
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

  #----------------------------------------------------------------------#
  #                           Instance Methods                           #
  #----------------------------------------------------------------------#

  # Returns color as HSL:
  # hue (0..360), saturation (0..1), lightness (0..1).
  # When saturation is 0, hue is nil.
  def hsl
    hsl_hsv_c[0]
  end

  # Returns the object's HSL-hue (0..360).
  def hsl_h
    hsl[0]
  end

  # Returns the object's HSL-saturation (0..1).
  def hsl_s
    hsl[1]
  end

  # Returns the object's HSL-lightness (0..1).
  def hsl_l
    hsl[2]
  end

  # Sets red, green, and blue using HSL values: hue (0..360), saturation (0..1), and lightness (0..1).
  def hsl=(*a)
    self.values = RGB::Color.hsl_to_values(*a)
  end

  # Sets HSL-hue to a number of degrees (0..360) or nil.
  #
  # Adjusts red, green, and blue, leaving saturation and lightness unchanged.
  # When hue is nil, saturation will be 0.
  def hsl_h=(degrees)
    self.hsl = hsl.fill(degrees,0,1)
  end

  # Sets HSL-saturation to a value between 0 and 1.
  #
  # Adjusts red, green, and blue, leaving hue and lightness unchanged.
  # When saturation is 0, hue will be nil.
  def hsl_s=(value)
    self.hsl = hsl.fill(value  ,1,1)
  end

  # Sets HSL-lightness to a value between 0 and 1.
  #
  # Adjusts red, green, and blue, leaving hue and saturation unchanged.
  # When lightness is 0 or 1, hue will be nil, and saturation will be 0.
  def hsl_l=(value)
    self.hsl = hsl.fill(value  ,2,1)
  end

  # Sets red, green, and blue by rotating the object's HSL-hue a number of degrees.
  def hsl_rotate!(degrees)
    self.hsl = zip_add(hsl, [degrees, 0, 0])
    self
  end

  # Creates one or more new RGB::Color objects by rotating this object's HSL-hue a number of degrees.
  def hsl_rotate(a_degrees, *b_degrees)
    if a_degrees.class != Array and b_degrees.none?
      RGB.hsl zip_add(hsl, [a_degrees, 0, 0])
    else
      ( [a_degrees] + b_degrees ).flatten.map { |degrees| RGB.hsl zip_add(hsl, [degrees, 0, 0]) }
    end
  end

end

#----------------------------------------------------------------------#
#                            Module Methods                            #
#----------------------------------------------------------------------#

module RGB

  class << self

    # Creates a new RGB::Color object from HSL values: hue (0..360), saturation (0..1), and lightness (0..1).
    def hsl(*a)
      Color.hsl(*a)
    end

  end

end
