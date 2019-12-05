require 'test/unit'

require 'redgreenblue/opt/terminal'

class Test_opt_terminal < Test::Unit::TestCase

  def test_simple
    assert_equal "\e[38;2;0;0;0m"      , RGB.black.to_terminal_foreground_24bit
    assert_equal "\e[48;2;255;255;255m", RGB.white.to_terminal_background_24bit
  end

end
