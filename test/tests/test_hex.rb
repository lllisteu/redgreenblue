require 'test/unit'

require 'redgreenblue'

class Test_hex < Test::Unit::TestCase

	def test_hex
		c = RGB.new

		c.rgb = [255, 0, 255]
		assert_equal 'ff00ff', c.hex
		assert_equal 'f0f', c.hex(true)

		c = RGB.hex '#0080ff'
		assert_equal '0080ff', c.hex
		assert_equal 0, c.red
		assert_equal 1, c.blue
		assert_equal 0.50, c.green.round(2)

		%w(#1a5 1a5 #11aa55 11aa55).each do |s|
			c.hex = s
			assert_equal '1a5', c.hex(true)
			assert_equal '11aa55', c.hex
		end
	end

	def test_shorthand
		assert_equal '#1a5', RGB.hex_shorthand('#11aa55')
		assert_equal '1a5',  RGB.hex_shorthand('11aa55')
		assert_equal '#1A5', RGB.hex_shorthand('#11AA55')
		assert_equal '1A5',  RGB.hex_shorthand('11AA55')

		assert_equal '#1a5', RGB.hex_shorthand('#1a5')
		assert_equal '1a5',  RGB.hex_shorthand('1a5')
		assert_equal '#1A5', RGB.hex_shorthand('#1A5')
		assert_equal '1A5',  RGB.hex_shorthand('1A5')

		assert_equal '#11Aa55', RGB.hex_shorthand('#11Aa55')
		assert_equal '#12aa55', RGB.hex_shorthand('#12aa55')
		assert_equal 'yellowish pink', RGB.hex_shorthand('yellowish pink')
	end

end