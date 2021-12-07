class RGB::Color

# rr, gg, bb methods

  # Returns the red component as an integer in the range 0..65535 (a 16-bit value).
  def rr
    (red   * 65535).round
  end

  # Returns the green component as an integer in the range 0..65535 (a 16-bit value).
  def gg
    (green * 65535).round
  end

  # Returns the blue component as an integer in the range 0..65535 (a 16-bit value).
  def bb
    (blue  * 65535).round
  end

  # Sets the red component using an integer in the range 0..65535 (a 16-bit value).
  def rr=(n)
    self.red   = n / 65535.0
  end

  # Sets the green component using an integer in the range 0..65535 (a 16-bit value).
  def gg=(n)
    self.green = n / 65535.0
  end

  # Sets the blue component using an integer in the range 0..65535 (a 16-bit value).
  def bb=(n)
    self.blue  = n / 65535.0
  end

# rrggbb methods

  # Returns the red, green, and blue components as integers in the range 0..65535 (three 16-bit values).
  def rrggbb
    [rr,gg,bb]
  end

  # Sets the red, green, and blue components using three integers in the range 0..65535 (three 16-bit values).
  def rrggbb=(*rrggbb)
    self.rr, self.gg, self.bb = rrggbb.flatten
  end

  # Creates a new Color object from red, green, and blue components as integers in the range 0..65535 (three 16-bit values).
  def self.rrggbb(*rrggbb)
    c = self.new
    c.rrggbb = rrggbb
    c
  end

end

#----------------------------------------------------------------------#
#                            Module Methods                            #
#----------------------------------------------------------------------#

module RGB

  class << self

    # Creates a new Color object from red, green, and blue components as integers in the range 0..65535 (three 16-bit values).
    def rrggbb(*rrggbb)
      Color.rrggbb(*rrggbb)
    end

  end

end
