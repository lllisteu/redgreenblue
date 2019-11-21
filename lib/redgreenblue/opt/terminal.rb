class RGB

  # With help from:
  # - https://gist.github.com/XVilka/8346728
  # - https://unix.stackexchange.com/questions/404414

  # Returns the ANSI escape sequence required to set the foreground color on a terminal to this color.
  # Only works on terminals that support 24-bit colors, so-called "true color".
  def to_terminal_foreground_24bit
    "\e[38;2;%d;%d;%dm" % rgb
  end

  # Returns the ANSI escape sequence required to set the background color on a terminal to this color.
  # Only works on terminals that support 24-bit colors, so-called "true color".
  def to_terminal_background_24bit
    "\e[48;2;%d;%d;%dm" % rgb
  end

  alias original_inspect inspect

  def inspect
    to_terminal_background_24bit + "   \e[0m " + original_inspect
  end

end
