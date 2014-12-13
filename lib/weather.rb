module LocalWeather

	def initialize
		sunny!
	end

	def sunny?
		@sunny
	end

	def sunny!
		@sunny = true
	end

	def stormy!
		@sunny = false
	end

	def random_weather(airport)
		stormy! if (1..4) === airport.weather_condition
		sunny! if (5..20) === airport.weather_condition
	end
	
end