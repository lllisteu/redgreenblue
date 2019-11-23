class RGB

  # Shows the Mac OS color picker to choose a color for the RGB object.
  def pick
    result = RGB.mac_choose(rrggbb)
    if result
      self.rrggbb = result
    end
  end

  # Shows the Mac OS color picker and creates an RGB object with the chosen color.
  # If no default color is specified, the picker defaults to a middle grey.
  def self.pick(default_color=RGB.new)
    result = RGB.mac_choose(default_color.rrggbb)
    if result
      RGB.rrggbb result
    else
      nil
    end
  end

  private

  # Uses Applescript to call the color picker on Mac OS.
  # - requires a 48-bit RGB triplet [rr, gg, bb] for default choice.
  #
  # - Returns nil when <cancel> is clicked or <esc> key hit.
  # - Otherwise returns 48-bit RGB triplet [rr, gg, bb].
  #
  # Applescript command documented here:
  # Standard Additions -> User Interaction -> choose color
  def self.mac_choose(color)

    app = case ENV['TERM_PROGRAM']
      when /iTerm\.app/
        'iTerm'
      else
        'Terminal'
      end

    script = <<~ENDSCRIPT
      tell application "#{app}"
        try
          return choose color default color { #{color[0]}, #{color[1]}, #{color[2]} }
        on error
          return ""
        end try
      end tell
    ENDSCRIPT

    result = `osascript -e '#{script}'`.chomp

    if result.empty?
      nil
    else
      (result.split( /,\w*/ )).map { |s| s.to_i }
    end

  end

end
