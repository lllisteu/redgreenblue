class RGB

  def invert!
    self.values = values.map { |v| 1-v }
    self
  end

  def invert
    dup.invert!
  end

end
