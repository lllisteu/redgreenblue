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

  alias hsb hsv

  alias hsb= hsv=

  alias hsb_rotate! hsv_rotate!

  alias hsb_rotate hsv_rotate

end
