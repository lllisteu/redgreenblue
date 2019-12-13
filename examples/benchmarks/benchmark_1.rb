# Cycle through all 24-bit colors and print their values.

require 'redgreenblue'

RGB.style = 'default'

RGB.each_24bit_color do |color|
  print "\r" + color.inspect
end

puts
