class RGB

  private

  def _inspect_default(prefix='RGB')
    "#{prefix} ##{hex} (red=%1.5f green=%1.5f blue=%1.5f)" % [red, green, blue]
  end

  def _inspect_swatch
    terminal_background + "   \e[0m"
  end

  def _inspect_simple
    _inspect_default _inspect_swatch
  end

  public

  def inspect
    _inspect_default
  end

  alias to_s inspect

end
