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

	def full?
		plane_count == @capacity
	end

	def empty?
		plane_count == 0
	end

	def dispatch_plane(plane)
		raise 'There are no planes to dispatch' if empty?
		plane.dispatch!
		@planes.delete(plane)
	end

	def land_plane(plane)
		raise 'There are no slots available at this airport' if full?
		plane.land!
		@planes << plane
	end

end