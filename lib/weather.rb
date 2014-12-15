module LocalWeather

	def set_weather!
		@stormy = random_number < 0.1 
	end

	def stormy?
		@stormy
	end

	private

	def random_number
		rand
	end

end