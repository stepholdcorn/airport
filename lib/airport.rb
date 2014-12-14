require_relative 'plane'
require_relative 'weather'

class Airport

	include LocalWeather

	DEFAULT_CAPACITY = 10

	attr_writer :capacity

	def initialize(options = {})
		@capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
		@planes = []
		@stormy = false
	end 

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def available_planes
		@planes
	end

	def plane_count
		available_planes.count
	end

	def full?
		plane_count == @capacity
	end

	def empty?
		plane_count == 0
	end

	def dispatch_plane(plane)
		raise 'It is too stormy to dispatch the plane' if stormy?
		raise 'There are no planes to dispatch' if empty?
		plane.dispatch!
		available_planes.delete(plane)
	end

	def land_plane(plane)
		raise 'It is too stormy to land the plane' if stormy?
		raise 'There are no slots available at this airport' if full?
		plane.land!
		available_planes << plane
	end

end