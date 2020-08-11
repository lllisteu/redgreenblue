class RGB

  #----------------------------------------------------------------------#
  #                            Class Methods                             #
  #----------------------------------------------------------------------#

  class << self

    # Parses a gpl (Gimp color palette) source string and returns an array of RGB objects.
    #
    # Options:
    # - compact: If set to false, returns nil for each line that can not be parsed to an RGB color. Defaults to true.
    def parse_gpl(source, compact: true, freeze: false)
      if source.respond_to? :each_line
        list = source.each_line.map do |line|
          if line.match( /^\s*(?<r>\d{1,3})\s+(?<g>\d{1,3})\s+(?<b>\d{1,3})(\s+(?<name>.*))?/ )
            color = RGB.rgb $~[:r].to_i, $~[:g].to_i, $~[:b].to_i
            color.name = $~[:name] if $~[:name]
            color
          else
            nil
          end
        end

        if compact
          list.compact!
        end

        if freeze
          list.freeze
          list.each &:freeze
        end

        list
      else
        raise ArgumentError, 'Not a valid source'
      end
    end

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

  # Returns the color in the format used in .gpl files (Gimp color palettes), including its name (if present).
  #
  # You can optionally supply a name as argument.
  def gpl(gpl_name=name)
    ( "%3d %3d %3d" % rgb ) +
    ( gpl_name.to_s.size != 0 ? "\t#{gpl_name}" : '' )
  end

end
