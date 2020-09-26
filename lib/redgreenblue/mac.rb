class RGB

  # Returns the color in the format used by AppleScript (a 48-bit RGB triplet).
  def applescript
    "{%i, %i, %i}" % rrggbb
  end

end
