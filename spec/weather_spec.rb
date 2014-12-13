require 'weather'

class Weather; include LocalWeather; end

describe LocalWeather do 

	let(:weather) {Weather.new}
	let(:airport) {double :airport}

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

	it 'should be sunny most of the time' do
		weather.stormy!
		allow(airport).to receive(:weather_condition) { 18 }
		weather.random_weather(airport)
		expect(weather).to be_sunny
	end

	it 'should be stormy some of the time' do
		allow(airport).to receive(:weather_condition) { 2 }
		weather.random_weather(airport)
		expect(weather).not_to be_sunny
	end

end
