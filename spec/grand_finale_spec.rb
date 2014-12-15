require 'airport'
require 'plane'

describe "The grand finale (last spec)" do

	let(:airport) {Airport.new(:capacity => 6, stormy?: false)}
	let(:plane) {Plane.new}
	let(:fleet) {Array.new(6){ Plane.new }}

	it 'all planes can land and have the status of not flying' do
		fleet.each { |plane| airport.land_plane(plane) }
		expect(fleet.all? { |plane| plane.flying? }).to eq(false)
	end

	it 'all planes can be dispatched and have the status of flying' do
		fleet.each { |plane| airport.land_plane(plane) }
		fleet.each { |plane| airport.dispatch_plane(plane)}
		expect(fleet.all? { |plane| plane.flying? }).to eq(true)
	end
	
end



