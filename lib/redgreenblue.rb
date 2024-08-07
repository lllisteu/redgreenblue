# The RGB module is the main namespace for redgreenblue.
#
# This module has many helper methods for creating RGB::Color objects.
# The example below shows seven ways to create an RGB::Color object for the exact same color.
# @example
#  require 'redgreenblue'
#
#  pink = RGB.new(1, 0.6, 0.8)
#  pink = RGB.rgb(255, 153, 204)
#  pink = RGB.rrggbb(65535, 39321, 52428)
#  pink = RGB.hex('f9c')
#  pink = RGB.hsl(330, 1, 0.8)
#  pink = RGB.hsv(330, 0.4, 1)
#  pink = RGB.at(16751052)
module RGB

  # This class represents an RGB color.
  class Color
  end

end

require 'redgreenblue/version'

require 'redgreenblue/base'

require 'redgreenblue/24bit'
require 'redgreenblue/48bit'
require 'redgreenblue/hex'
require 'redgreenblue/int'

require 'redgreenblue/hsl'
require 'redgreenblue/hsv'
require 'redgreenblue/hsb'

require 'redgreenblue/ostwald'
require 'redgreenblue/hwb'

require 'redgreenblue/gamma'

require 'redgreenblue/cie_1931'
require 'redgreenblue/cie_1976'
require 'redgreenblue/cie_1994'

require 'redgreenblue/name'

require 'redgreenblue/inspect'
require 'redgreenblue/view'
require 'redgreenblue/lazy'

require 'redgreenblue/rgb565'
require 'redgreenblue/bgr24bit'
require 'redgreenblue/gif'
require 'redgreenblue/terminal'
require 'redgreenblue/web'
require 'redgreenblue/gpl'
require 'redgreenblue/mac'

require 'redgreenblue/yuv'

require 'redgreenblue/match'
require 'redgreenblue/mix'
require 'redgreenblue/misc'
require 'redgreenblue/random'

require 'redgreenblue/os'
