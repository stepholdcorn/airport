 require 'weather'

 class Weather; include LocalWeather; end

 describe LocalWeather do 

	let(:weather) {Weather.new}

	it 'should be able to be stormy' do
		allow(weather).to receive(:random_weather) { true }
		expect(weather).to be_stormy
	end 

end
