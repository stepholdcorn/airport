class Airport

	DEFAULT_CAPACITY = 10

	attr_writer :capacity

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@planes = []
	end 

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def plane_count
		@planes.count
	end

	def dispatch_plane(plane)
		plane.dispatch!
		@planes.delete(plane)
	end

	def land_plane(plane)
		plane.land!
		@planes << plane
	end

end