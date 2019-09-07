class RGB

  def shuffle!
    self.values = values.shuffle
    self
  end

  def randomize!
    self.values = Kernel::rand, Kernel::rand, Kernel::rand
    self
  end

  def self.rand
    new(Kernel::rand, Kernel::rand, Kernel::rand)
  end

end
