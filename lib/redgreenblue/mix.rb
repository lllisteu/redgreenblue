class RGB::Color

  # Changes the object's color by mixing it with a portion of another RGB::Color.
  def mix!(another,portion=0.5)
    self.values = mix_values(another.values, portion)
    self
  end

  # Creates a new RGB::Color by mixing this object's color with a portion of another RGB::Color.
  def mix(another,portion=0.5)
    RGB::Color.new mix_values(another.values, portion)
  end

  # Changes the object's color by mixing it with a portion of white.
  def whiten!(portion=0.5)
    mix!(RGB.white, portion)
  end

  # Creates one or more new RGB::Colors by mixing this object's color with a portion of white.
  def whiten(portion=0.5, *portions)
    if (portion.class != Array) and portions.none?
      mix(RGB.white, portion)
    else
      ( [portion].flatten + portions ).map { |p| mix(RGB.white, p) }
    end
  end

  # Changes the object's color by mixing it with a portion of black.
  def blacken!(portion=0.5)
    mix!(RGB.black, portion)
  end

  # Creates one or more new RGB::Colors by mixing this object's color with a portion of black.
  def blacken(portion=0.5, *portions)
    if (portion.class != Array) and portions.none?
      mix(RGB.black, portion)
    else
      ( [portion].flatten + portions ).map { |p| mix(RGB.black, p) }
    end
  end

  # Returns a number of colors, gradually changing from this color to another color.
  #
  # The resulting colors are spaced evenly in the RGB color space.
  def steps(another,step_count=1,include_begin=false)
    # origin (self, optional)
    ( include_begin ? [self.dup] : [] ) +
    # ...plus intermediate colors
    (1..step_count-1).map { |c| mix(another, c.to_f/step_count) } +
    # ...plus destination color
    [another.dup]
  end

  # Returns a number of colors, gradually changing from this color to another color.
  #
  # The resulting colors are spaced evenly by their HSL values (hue, saturation, and lightness).
  def steps_hsl(another,step_count=1,include_begin=false)
    steps_hsx(another,step_count,include_begin, :hsl)
  end

  # Returns a number of colors, gradually changing from this color to another color.
  #
  # The resulting colors are spaced evenly by their HSV values (hue, saturation, and value).
  def steps_hsv(another,step_count=1,include_begin=false)
    steps_hsx(another,step_count,include_begin, :hsv)
  end

  alias steps_hsb steps_hsv

  private

  def mix_values(some_values, portion)
    raise(ArgumentError, "Portion '#{portion}' not in range (0..1)") unless (0..1).include? portion
    [
      ( red   * (1 - portion) ) + ( some_values[0] * portion ),
      ( green * (1 - portion) ) + ( some_values[1] * portion ),
      ( blue  * (1 - portion) ) + ( some_values[2] * portion )
    ]
  end

  def steps_hsx(another,step_count=1,include_begin=false,type)
    raise NotImplementedError unless [:hsl, :hsv].include? type
    src_hsx  = self.send(type)
    dest_hsx = another.send(type)

    # Take care of achromatic origin/destination
    src_hsx[0]  = ( dest_hsx[0] || 0 ) unless src_hsx[0]
    dest_hsx[0] = ( src_hsx[0]  || 0 ) unless dest_hsx[0]

    step = [angle_of_travel(src_hsx[0], dest_hsx[0]), dest_hsx[1]-src_hsx[1], dest_hsx[2]-src_hsx[2] ].map { |v| v/step_count }

    # origin (self, optional)
    ( include_begin ? [self.dup] : [] ) +
    # ...plus intermediate colors
    (1..step_count-1).map { |c| RGB.send(type, zip_add(src_hsx, step.map { |v| v*c })) } +
    # ...plus destination color
    [another.dup]

  end

end
