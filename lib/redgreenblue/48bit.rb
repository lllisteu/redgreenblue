class RGB

# rr, gg, bb methods

	def rr
		(red   * 65535).round
	end

	def gg
		(green * 65535).round
	end

	def bb
		(blue  * 65535).round
	end

	def rr=(n)
		self.red   = n / 65535.0
	end

	def gg=(n)
		self.green = n / 65535.0
	end

	def bb=(n)
		self.blue  = n / 65535.0
	end

# rrggbb methods

	def rrggbb
		[rr,gg,bb]
	end

	def rrggbb=(rrggbb)
		self.rr = rrggbb[0]
		self.gg = rrggbb[1]
		self.bb = rrggbb[2]
	end

# factory method

	def self.rrggbb(rrggbb)
		c = self.new
		c.rrggbb = rrggbb
		c
	end

end