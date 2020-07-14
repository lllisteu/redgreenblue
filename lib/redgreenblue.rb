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

  inspect lazy

  rgb565 bgr24bit gif terminal web gpl

  mix misc random

  os

).each { |m| require "redgreenblue/#{m}" }
