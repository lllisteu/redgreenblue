class RGB

  # Creates a white RGB object.
  def self.white
    new(1,1,1)
  end

  # Creates a black RGB object.
  def self.black
    new(0,0,0)
  end

  # Creates a grey RGB object. Defaults to lightness 0.5, a middle grey. Black equals grey(0), white equals grey(1).
  #
  # ::gray is an alias for ::grey.
  def self.grey(lightness=0.5)
    new(lightness, lightness, lightness)
  end

  # Alias gray for grey.
  self.singleton_class.send(:alias_method, :gray, :grey)

  # Creates a pure red RGB object.
  def self.red
    new(1,0,0)
  end

  # Creates a pure green RGB object.
  def self.green
    new(0,1,0)
  end

  # Creates a pure blue RGB object.
  def self.blue
    new(0,0,1)
  end

  # Creates a yellow RGB object.
  def self.yellow
    new(1,1,0)
  end

  # Creates a cyan RGB object.
  def self.cyan
    new(0,1,1)
  end

  # Creates a magenta RGB object.
  def self.magenta
    new(1,0,1)
  end

end
