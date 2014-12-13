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
	
end