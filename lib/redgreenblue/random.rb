class RGB

  def shuffle!
    self.red, self.green, self.blue = [red, green, blue].shuffle
    self
  end

  def randomize!
    self.red, self.green, self.blue = Kernel::rand, Kernel::rand, Kernel::rand
    self
  end

  def self.rand
    new([Kernel::rand, Kernel::rand, Kernel::rand])
  end

end
