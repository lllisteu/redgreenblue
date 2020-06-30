class RGB

  #----------------------------------------------------------------------#
  #                            Class Methods                             #
  #----------------------------------------------------------------------#

  class << self

    private

    # Reverse-engineered from:
    # - https://github.com/GNOME/gimp/blob/5d79fba8238a27b8691556489898d33b3fa0dda0/app/core/gimppalette-load.c
    def gpl_header(name, columns=nil)
      "GIMP Palette\n" +
      "Name: #{name}\n" +
      ( columns ? "Columns: #{columns}\n" : '' )
    end

  end

  #----------------------------------------------------------------------#
  #                           Instance Methods                           #
  #----------------------------------------------------------------------#

  # Returns the color in the format used in .gpl files (Gimp color palettes). A name for the color is optional.
  def gpl(name=nil)
    ( "%3d %3d %3d" % rgb ) + ( name ? "\t#{name}" : '' )
  end

end
