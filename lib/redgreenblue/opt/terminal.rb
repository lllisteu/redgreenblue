# Optional support for 24-bit color terminals.

# Automatically load core RGB class before loading options.
require 'redgreenblue'

class RGB

  alias original_inspect inspect

  def inspect
    terminal_background + "   \e[0m " + original_inspect
  end

end
