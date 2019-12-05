require 'test/unit'

require 'redgreenblue/opt/terminal'

class Test_opt_terminal < Test::Unit::TestCase

  def test_simple
    assert_equal "\e[38;2;0;0;0m"      , RGB.black.terminal_foreground
    assert_equal "\e[48;2;255;255;255m", RGB.white.terminal_background
  end

end
