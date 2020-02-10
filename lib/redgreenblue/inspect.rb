class RGB

  private

  def _inspect_default(prefix='RGB')
    "#{prefix} ##{hex} (red=%1.5f green=%1.5f blue=%1.5f)" % [red, green, blue]
  end

  def _inspect_hex
    "##{hex}"
  end

  def _inspect_swatch
    terminal_background + "   \e[0m"
  end

  def _inspect_short
    _inspect_swatch + " ##{hex}"
  end

  def _inspect_simple
    _inspect_default _inspect_swatch
  end

  public

  # Returns a programmer-friendly representation of the object.
  #
  # You can choose among several inspect styles. See the styles, style, and style= class methods.
  def inspect
    send "_inspect_#{self.class.style}"
  end

  # Returns a string representation of the object.
  def to_s
    _inspect_default
  end

  # Returns the base inspect style, dependent on the COLORTERM environment variable.
  def self.base_style
    ENV['COLORTERM'] == 'truecolor' ? 'simple' : 'default'
  end

  # Returns the current inspect style.
  def self.style
    @@style ||= base_style
  end

  # Returns a list of all available inspect styles.
  def self.styles
    ( self.instance_methods + self.private_instance_methods ).grep( /^_inspect_(.*)/ ) { $1 }.sort
  end

  # Selects an inspect style.
  #
  # Only the first few characters of your preferred style are required.
  def self.style=(s)
    @@style = styles.grep( /^#{s.to_s.downcase}/ ).first || style
  end

end
