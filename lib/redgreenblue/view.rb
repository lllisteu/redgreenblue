class RGB::Color

  # Prints a color swatch and details for the RGB::Color object, using multiple lines.
  #
  # You can optionally supply a second color to be shown inside the swatch, for comparison.
  def view(other=nil)
    puts _inspect_view other
  end

  alias v view

  private

  def _inspect_view(other=nil)
    o = []
    o << 3.times.map { terminal_background + "      \e[0m "}
    o << [ "#{_inspect_hex} ", '%-7.7s ' % color_space, '        ' ]

    if other
      o[0][1] = terminal_background + '  ' + other.terminal_background + '  ' + terminal_background + "  \e[0m "
    end

    o << components.map { |c| c.terminal_background + "  \e[0m " }
    o << %w(R: G: B:)
    o << values.map { |v| '%1.5f ' % v }
    o << rgb.map { |v| '%3d ' % v }

    o << %w(H: S: L:)
    o << hsl.map { |v| v ? ('%7.3f ' % v) : '  -     ' }
    o << %w(H: S: B:)
    o << hsb.map { |v| v ? ('%7.3f ' % v) : '  -     ' }

    o << 3.times.map { (ostwald_color ? ostwald_color.terminal_background + "  \e[0m " : '   ') }
    o << %w(C: W: K:)
    o << ostwald_cwk.map { |v| '%1.3f ' % v }

    o.transpose.map(&:join).join("\n")
  end

end
