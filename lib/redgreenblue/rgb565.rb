class RGB

	def rgb565
		[((r >> 3) << 11) + ((g >> 2) << 5) + (b >> 3)].pack 'S<'
	end

	# https://stackoverflow.com/questions/2442576/
	def rgb565=(s)
		v = ( s.unpack "S<" )[0]
		self.r = ( ( v & 0xf800 ) >> 11 ) << 3
		self.g = ( ( v & 0x07e0 ) >>  5 ) << 2
		self.b = ( ( v & 0x001f )       ) << 3
	end

	def rgb565_binary
		rgb565.bytes.reverse.map { |b| "%08b" % b }.join
	end

	# factory method
	def self.rgb565(s)
		c = self.new
		c.rgb565 = s
		c
	end

end
