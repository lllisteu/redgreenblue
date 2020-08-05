class RGB

  # Prints details for the RGB object, using multiple lines.
  def view
    puts _inspect_view
  end

  alias v view

  private

  def _inspect_view
    o = []
    o << 3.times.map { terminal_background + "      \e[0m "}
    o << [ "#{_inspect_hex} ", '%-7.7s ' % color_space, '        ' ]

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
