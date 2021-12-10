class RGB::Color

  # With help from:
  # - https://gist.github.com/XVilka/8346728
  # - https://unix.stackexchange.com/questions/404414

  # Returns the ANSI escape sequence required to set the foreground color on a terminal to this color.
  # Only works on terminals that support 24-bit colors, so-called "true color".
  def terminal_foreground
    "\e[38;2;%d;%d;%dm" % rgb
  end

  # Returns the ANSI escape sequence required to set the background color on a terminal to this color.
  # Only works on terminals that support 24-bit colors, so-called "true color".
  def terminal_background
    "\e[48;2;%d;%d;%dm" % rgb
  end

end
