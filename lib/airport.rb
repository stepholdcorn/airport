class Airport

	def initialize
		@plane
	end 

	def dispatch_plane(plane)
		plane.dispatch!
	end

	def land_plane(plane)
		plane.land!
	end

end