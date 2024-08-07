require 'redgreenblue/base'

class RGB::Color

  # Returns the color's YUV values.
  #
  # Based on:
  # - http://www.martinreddy.net/gfx/faqs/colorconv.faq (section 6.1)
  # - https://en.wikipedia.org/wiki/Y%E2%80%B2UV
  def yuv(round: true)
    [
      red *  0.299 + green *  0.587 + blue *  0.114,
      red * -0.147 + green * -0.289 + blue *  0.436,
      red *  0.615 + green * -0.515 + blue * -0.100
    ].map { |v| round ? v.round(6) : v }

    # Wikipedia (2024-Aug-7)
    # suggests slightly different factors for U and V:
    #
    # U = red * -0.14713 + green * -0.28886 + blue *  0.436
    # V = red *  0.615   + green * -0.51499 + blue * -0.10001
  end

end
