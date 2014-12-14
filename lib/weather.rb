module LocalWeather

	def stormy
		@stormy
	end

	def random_weather
		random_number = [*1..20].sample
		stormy = false if (5..20) === random_number
		stormy = true if (1..4) === random_number
	end

	def stormy?
		random_weather == true
	end

end