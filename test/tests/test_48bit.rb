require 'test/unit'

require 'redgreenblue'

class Test_48bit < Test::Unit::TestCase

	# assign value, expect result
	def helper_rr_gg_bb(value,result)
		c = RGB.new
		c.gg = value
		assert_equal result, c.gg
	end

	def helper_rrggbb(value,result)
		c = RGB.new
		c.rrggbb = [value, value, value]
		assert_equal [result, result, result], c.rrggbb

		c = RGB.rrggbb [value, value, value]
		assert_equal [result, result, result], c.rrggbb
	end

	def test_assignment
		(0..65535).each do |v|
			helper_rr_gg_bb(v, v)
			helper_rrggbb(v,v)
		end
	end

	def test_normalize_low
		[ -1, 0, -255, -65535 ].each do |v|
			helper_rr_gg_bb(v, 0)
		end
	end

	def test_normalize_high
		[ 65536, 123456789].each do |v|
			helper_rr_gg_bb(v,65535)
		end
	end

end