class RGB

	attr_reader :red, :green, :blue

	def initialize(v=[0.5, 0.5, 0.5])
		self.red   = v[0]
		self.green = v[1]
		self.blue  = v[2]
	end

	def red=(n)
		@red = normalize(n)
	end

	def green=(n)
		@green = normalize(n)
	end

	def blue=(n)
		@blue = normalize(n)
	end

	private

	# limit to 0..1
	def normalize(n)
		n <= 0 ? 0.0 : n >= 1 ? 1.0 : n
	end

end