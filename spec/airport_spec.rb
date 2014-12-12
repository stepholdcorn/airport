require 'airport'

describe Airport do 
	let(:airport) {Airport.new(:capacity => 12)}
	let(:plane) {double :plane}

	context 'dispatching and landing planes' do

		it 'should be able to dispatch a plane' do
			expect(plane).to receive(:dispatch!)
			airport.dispatch_plane(plane)
		end

		it 'should reduce the plane count when a plane has been dispatched' do
			expect(plane).to receive(:dispatch!)
			airport.dispatch_plane(plane)
			expect(airport.plane_count).to eq(0)
		end

		it 'should be able to land a plane' do
			expect(plane).to receive(:land!)
			airport.land_plane(plane)
		end

		it 'should increase the plane count when a plane has landed' do
			expect(plane).to receive(:land!)
			airport.land_plane(plane)
			expect(airport.plane_count).to eq(1)
		end

	end

	context 'traffic control' do

		it 'should allow setting of default capacity when initialized' do
			expect(airport.capacity).to eq(12)
		end

	end

end