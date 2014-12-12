require 'airport'

describe Airport do 
	let(:airport) {Airport.new}
	let(:plane) {double :plane}

context 'dispatching and landing planes' do

it 'should be able to dispatch a plane' do
	expect(plane).to receive(:dispatch!)
	airport.dispatch_plane(plane)
end

it 'should be able to land a plane' do
	expect(plane).to receive(:land!)
	airport.land_plane(plane)
end

end

end