require 'redgreenblue/hsv'

class RGB

  ########################################################################
  # Class methods                                                        #
  ########################################################################

  class << self

    alias hsb hsv

  end

  ########################################################################
  # Instance methods                                                     #
  ########################################################################

  alias hsb         hsv

  alias hsb_h       hsv_h

  alias hsb_s       hsv_s

  alias hsb_b       hsv_v

  alias hsb=        hsv=

  alias hsb_h=      hsv_h=

  alias hsb_s=      hsv_s=

  alias hsb_b=      hsv_v=

  alias hsb_rotate! hsv_rotate!

  alias hsb_rotate  hsv_rotate

end
