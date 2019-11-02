class RGB

  def inspect
    "RGB ##{hex} (red=%1.5f green=%1.5f blue=%1.5f)" % [red, green, blue]
  end

  alias to_s inspect

end
