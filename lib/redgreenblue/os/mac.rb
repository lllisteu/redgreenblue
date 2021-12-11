class RGB::Color

  # On Mac OS, shows the color picker to choose a color for this object.
  # Not available on other platforms.
  def pick
    result = RGB::Color.mac_choose(self)
    if result
      self.rrggbb = result
    end
  end

  # On Mac OS, shows the color picker and creates an RGB::Color with the chosen color.
  # Not available on other platforms.
  #
  # If no default color is specified, the picker defaults to a middle grey.
  def self.pick(default_color=RGB::Color.new)
    result = RGB::Color.mac_choose(default_color)
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
  def self.mac_choose(default_color)

    app = case ENV['TERM_PROGRAM']
      when /iTerm\.app/
        'iTerm'
      else
        'Terminal'
      end

    script = <<~ENDSCRIPT
      tell application "#{app}"
        try
          return choose color default color #{default_color.applescript}
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


module RGB

  class << self

    # On Mac OS, shows the color picker and creates an RGB::Color with the chosen color.
    # Not available on other platforms.
    #
    # If no default color is specified, the picker defaults to a middle grey.
    def pick(default_color=new)
      Color.pick(default_color)
    end

  end

end
