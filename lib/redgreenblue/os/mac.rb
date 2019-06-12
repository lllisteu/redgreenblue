class RGB

  def pick
    result = RGB.mac_choose(rrggbb)
    if result
      self.rrggbb = result
    end
  end

# factory method

  def self.pick
    result = RGB.mac_choose(RGB.new.rrggbb)
    if result
      RGB.rrggbb result
    else
      nil
    end
  end

  private

# Use Applescript to call color picker on Mac.
# - requires a 48-bit RGB triplet [rr, gg, bb] for default choice.
#
# - Returns nil when <cancel> is clicked or <esc> key hit.
# - Otherwise returns 48-bit RGB triplet [rr, gg, bb].
  def self.mac_choose(color)

    script = <<~ENDSCRIPT
      tell application "Terminal"
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
