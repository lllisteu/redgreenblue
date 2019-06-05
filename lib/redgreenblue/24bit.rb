class RGB

# r, g, b methods

	def r
		(red   * 255).round
	end

	def g
		(green * 255).round
	end

	def b
		(blue  * 255).round
	end

	def r=(n)
		self.red   = n / 255.0
	end

	def g=(n)
		self.green = n / 255.0
	end

	def b=(n)
		self.blue  = n / 255.0
	end

# rgb methods

	def rgb
		[r,g,b]
	end

	def rgb=(rgb)
		self.r = rgb[0]
		self.g = rgb[1]
		self.b = rgb[2]
	end

# factory method

	def self.rgb(rgb)
		c = self.new
		c.rgb = rgb
		c
	end

end