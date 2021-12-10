class RGB::Color

  #----------------------------------------------------------------------#
  #                            Class Methods                             #
  #----------------------------------------------------------------------#

  class << self

    # Creates a white RGB::Color object.
    def white
      new(1,1,1)
    end

    # Creates a black RGB::Color object.
    def black
      new(0,0,0)
    end

    # Creates a grey RGB::Color object. Defaults to lightness 0.5, a middle grey. Black equals grey(0), white equals grey(1).
    #
    # ::gray is an alias for ::grey.
    def grey(lightness=0.5)
      new(lightness, lightness, lightness)
    end

    # Alias gray for grey.
    alias gray grey

    # Creates a pure red RGB::Color object.
    def red
      new(1,0,0)
    end

    # Creates a pure green RGB::Color object.
    def green
      new(0,1,0)
    end

    # Creates a pure blue RGB::Color object.
    def blue
      new(0,0,1)
    end

    # Creates a yellow RGB::Color object.
    def yellow
      new(1,1,0)
    end

    # Creates a cyan RGB::Color object.
    def cyan
      new(0,1,1)
    end

    # Creates a magenta RGB::Color object.
    def magenta
      new(1,0,1)
    end

    # Returns the 8 corners of the RGB cube.
    def corners
      [ black, red, yellow, green, cyan, blue, magenta, white ]
    end

    # Returns the centre of the RGB cube.
    def centre
      grey
    end

    alias center centre

  end

end

#----------------------------------------------------------------------#
#                            Module Methods                            #
#----------------------------------------------------------------------#

module RGB

  class << self

    # Creates a white RGB::Color object.
    def white
      Color.white
    end

    # Creates a black RGB::Color object.
    def black
      Color.black
    end

    # Creates a grey RGB::Color object. Defaults to lightness 0.5, a middle grey. Black equals grey(0), white equals grey(1).
    #
    # ::gray is an alias for ::grey.
    def grey(lightness=0.5)
      Color.grey(lightness)
    end

    # Alias gray for grey.
    alias gray grey

    # Creates a pure red RGB::Color object.
    def red
      Color.red
    end

    # Creates a pure green RGB::Color object.
    def green
      Color.green
    end

    # Creates a pure blue RGB::Color object.
    def blue
      Color.blue
    end

    # Creates a yellow RGB::Color object.
    def yellow
      Color.yellow
    end

    # Creates a cyan RGB::Color object.
    def cyan
      Color.cyan
    end

    # Creates a magenta RGB::Color object.
    def magenta
      Color.magenta
    end

    # Returns the 8 corners of the RGB cube.
    def corners
      [ black, red, yellow, green, cyan, blue, magenta, white ]
    end

    # Returns the centre of the RGB cube.
    def centre
      grey
    end

    alias center centre

  end

end
