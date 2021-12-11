class RGB::Color

  # Shuffles the object's red, green, and blue values.
  def shuffle!
    self.values = values.shuffle
    self
  end

  # Creates a new RGB::Color with this object's red, green, and blue values shuffled.
  def shuffle
    RGB::Color.new values.shuffle
  end

  # Assigns random values to red, green, and blue.
  def randomize!
    self.values = Kernel::rand, Kernel::rand, Kernel::rand
    self
  end

  # Creates a new RGB::Color with random red, green, and blue values.
  def self.rand
    new(Kernel::rand, Kernel::rand, Kernel::rand)
  end

end

#----------------------------------------------------------------------#
#                            Module Methods                            #
#----------------------------------------------------------------------#

module RGB

  class << self

    # Creates a new RGB::Color with random red, green, and blue values.
    def rand
      Color.rand
    end

  end

end
