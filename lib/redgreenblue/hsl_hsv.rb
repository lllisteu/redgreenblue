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

    alias hsb hsv

    private

    # Calculates RGB values from HSL or HSV.
    # With help from:
    # - https://en.wikipedia.org/wiki/HSL_and_HSV
    def hsm_to_values(type, *a)
      raise NotImplementedError unless [:hsl, :hsv].include? type

      hue, saturation, magnitude = a.flatten

      if ( saturation == 0 ) or ( ! hue )
        return Array.new(3) { magnitude }
      end

      hue = hue.modulo 360

      chroma = case type
        when :hsl
          ( 1 - ( 2 * magnitude - 1 ).abs ) * saturation
        when :hsv
          magnitude * saturation
      end

      values = [
        chroma,
        ( 1 - ( ( hue / 60.0 ).modulo(2) - 1 ).abs ) * chroma,
        0
      ]

      values = case type
        when :hsl
          values.map { |v| ( v + magnitude - chroma / 2.0 ).round(9) }
        when :hsv
          values.map { |v| ( v + magnitude - chroma       ).round(9) }
      end

      # order values according to hue sextant
      [ [0,1,2], [1,0,2], [2,0,1], [2,1,0], [1,2,0], [0,2,1] ][hue.div 60].map { |i| values[i]}
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

  # Sets red, green, and blue using HSL values: hue (0..360), saturation (0..1), and lightness (0..1).
  def hsl=(*a)
    self.values = RGB.hsl_to_values(*a)
  end

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

  # Creates a new RGB object by rotating this object's HSV-hue a number of degrees.
  #
  # #hsb_rotate is an alias for #hsv_rotate.
  def hsv_rotate(degrees)
    RGB.hsv zip_add(hsv, [degrees, 0, 0])
  end

  alias hsb hsv

  alias hsb= hsv=

  alias hsb_rotate hsv_rotate

  private

  # Compute HSL, HSV, and chroma.
  # With help from:
  # - https://en.wikipedia.org/wiki/HSL_and_HSV
  def hsl_hsv_c
    sorted_hash = to_h
    min, max = sorted_hash.values.values_at(2,0)

    chroma = max - min

    hue =
      if chroma == 0
        nil
      else
        ( case sorted_hash.keys.first
          when :red
            60 * ( ( ( green - blue  ) / chroma ).modulo 6 )
          when :green
            60 * ( (   blue  - red   ) / chroma + 2 )
          when :blue
            60 * ( (   red   - green ) / chroma + 4 )
          end
        ).round(9)
      end

    lightness = ( min + max ) / 2.0

    saturation_hsl =
      chroma == 0 ? 0.0 : ( chroma / ( 1 - (2 * lightness - 1).abs ) ).round(9)

    value = max

    saturation_hsv =
      value == 0 ? 0.0 : chroma / value

    [ [hue, saturation_hsl, lightness], [hue, saturation_hsv, value], chroma ]
  end

end
