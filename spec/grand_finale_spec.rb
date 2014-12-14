require 'airport'
require 'plane'

describe "The grand finale (last spec)" do

	let(:airport) {Airport.new(:capacity => 6)}
	let(:plane) {Plane.new}

	it 'all planes can land and have the status of not flying' do
		allow(airport).to receive(:stormy?) { false }
		6.times { airport.land_plane(plane) }
		#•••••••••••••••
	end
end


