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

%w(

  version

  base

  24bit 48bit hex int

  hsl hsv hsb

  ostwald hwb

  gamma

  cie_1931 cie_1976 cie_1994

  name

  inspect view lazy

  rgb565 bgr24bit gif terminal web gpl mac

  match mix misc random

  os

).each { |m| require "redgreenblue/#{m}" }
