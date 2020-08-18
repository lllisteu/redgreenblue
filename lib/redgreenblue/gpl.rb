class RGB

  #----------------------------------------------------------------------#
  #                            Class Methods                             #
  #----------------------------------------------------------------------#

  class << self

    # Creates a new RGB object from a line of gpl (Gimp color palette) input. Returns nil if not successful.
    #
    # @example
    #  RGB.gpl "255 153 204 pink"
    def gpl(line)
      if line.chomp.match( /^\s*(?<r>\d{1,3})\s+(?<g>\d{1,3})\s+(?<b>\d{1,3})(\s+(?<name>.*))?/ )
        color = RGB.rgb $~[:r].to_i, $~[:g].to_i, $~[:b].to_i
        color.name = $~[:name] if $~[:name]
        color
      else
        nil
      end
    end

    # Loads a gpl (Gimp color palette) source and returns an array of RGB objects.
    #
    # Options:
    # - file: Path to a .gpl file to be loaded.
    # - url: URL for a .gpl source to be loaded.
    # - compact: Defaults to true. If set to false, returns nil for each line that can not be parsed to an RGB color.
    # - freeze: Defaults to false. If set to true, returns a frozen array of frozen objects.
    #
    # @example String
    #  RGB.load_gpl "255 0 0\tred\n255 153 204\tpink\n"
    # @example File
    #  RGB.load_gpl file: '/path/to/palette.gpl'
    #  RGB.load_gpl file: '/path/to/palette.gpl', compact: false
    # @example URL
    #  RGB.load_gpl url: 'https://lospec.com/palette-list/yuko-tomita-time.gpl'
    def load_gpl(source=nil, file: nil, url: nil, compact: true, freeze: false)

      if ! source
        if file
          source = File.open file
        elsif url
          require 'open-uri'
          source = URI.open url
        end
      end

      if source.respond_to? :each_line
        list = source.each_line.map { |line| RGB.gpl(line) }

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
