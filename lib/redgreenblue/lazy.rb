class RGB

  def self.white
    new(1,1,1)
  end

  def self.black
    new(0,0,0)
  end

  def self.grey(n=0.5)
    new(n,n,n)
  end

  # Alias gray for grey
  self.singleton_class.send(:alias_method, :gray, :grey)

end
