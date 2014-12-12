class Plane

	def initialize
		dispatch!
	end

	def flying?
		@flying
	end

	def dispatch!
		@flying = true
	end

	def land!
		@flying = false
	end

end