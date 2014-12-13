require 'weather'

class Weather; include LocalWeather; end

describe LocalWeather do 

	let(:weather) {Weather.new}

	it 'should be sunny on initialization' do
		expect(weather).to be_sunny
	end

	it 'should be able to be stormy' do
		weather.stormy!
		expect(weather).not_to be_sunny
	end

	it 'should be able to be sunny again after a storm' do
		weather.stormy!
		weather.sunny!
		expect(weather).to be_sunny
	end

end
