class RGB
end

%w(

  version

  base

  24bit 48bit hex int

  hsl hsv hsb

  ostwald

  gamma

  cie_1931 cie_1976

  name

  inspect view lazy

  rgb565 bgr24bit gif terminal web gpl mac

  match mix misc random

  os

).each { |m| require "redgreenblue/#{m}" }
