class RGB::Color

  private

  def _inspect_default(prefix='RGB')
    "#{prefix} #{_inspect_hex} (red=%1.5f green=%1.5f blue=%1.5f)" % [red, green, blue] + ( name ? ' ' + name : '' )
  end

  def _inspect_hex
    (self == snap ? '#' : '~') + hex
  end

  def _inspect_swatch
    terminal_background + "   \e[0m"
  end

  def _inspect_short
    "#{_inspect_swatch} #{_inspect_hex}"
  end

  def _inspect_simple
    _inspect_default _inspect_swatch
  end

  def _inspect_name
    _inspect_swatch + ( name ? ' ' + name : '' )
  end

  def _inspect_wilhelm
    _inspect_short +
    if h = hsl_h
      " (H:%7.3f %s \e[0m" % [h, ostwald_color.terminal_background]
    else
      ' (H:  -      '
    end +
    ' C:%5.3f W:%5.3f K:%5.3f)' % cwk +
    ( name ? ' ' + name : '' )
  end

  public

  # Returns a programmer-friendly representation of the object.
  #
  # You can choose among several inspect styles. See the styles, style, and style= class methods.
  def inspect
    send "_inspect_#{RGB.style}"
  end

  # Returns a string representation of the object.
  def to_s
    _inspect_default
  end

end


module RGB

  class << self

    # Returns the base inspect style, dependent on the COLORTERM environment variable.
    def base_style
      if styles.include? ENV['REDGREENBLUE_STYLE']
        ENV['REDGREENBLUE_STYLE']
      else
        if ENV['COLORTERM'] == 'truecolor'
          'simple'
        else
          'default'
        end
      end
    end

    # Returns the current inspect style.
    def style
      @@style ||= base_style
    end

    # Returns a list of all available inspect styles.
    def styles
      ( Color.instance_methods + Color.private_instance_methods ).grep( /^_inspect_(.*)/ ) { $1 }.sort
    end

    # Selects an inspect style.
    #
    # Only the first few characters of your preferred style are required.
    def style=(s)
      @@style = styles.grep( /^#{s.to_s.downcase}/ ).first || style
    end

  end

end
