class RGB

  # Shuffles the object's red, green, and blue values.
  def shuffle!
    self.values = values.shuffle
    self
  end

  # Creates a new RGB object with this object's red, green, and blue values shuffled.
  def shuffle
    RGB.new values.shuffle
  end

  # Assigns random values to red, green, and blue.
  def randomize!
    self.values = Kernel::rand, Kernel::rand, Kernel::rand
    self
  end

  # Creates a new RGB object with random red, green, and blue values.
  def self.rand
    new(Kernel::rand, Kernel::rand, Kernel::rand)
  end

end
