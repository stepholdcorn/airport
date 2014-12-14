require 'airport'

describe Airport do 

	let(:airport) {Airport.new(:capacity => 12)}
	let(:plane) {double :plane}
	let(:weather) {double :weather}

	context 'dispatching and landing planes' do

		it 'should reduce the plane count when a plane has been dispatched' do
			allow(plane).to receive(:land!)
			airport.land_plane(plane)
			allow(plane).to receive(:dispatch!)
			airport.dispatch_plane(plane)
			expect(airport.plane_count).to eq(0)
		end

		it 'should increase the plane count when a plane has landed' do
			allow(plane).to receive(:land!)
			allow(airport).to receive(:stormy?) { false }
			airport.land_plane(plane)
			expect(airport.plane_count).to eq(1)
		end

		it 'should not land a plane if it is stormy' do
			allow(plane).to receive(:land!)
			allow(airport).to receive(:stormy?) { true }
			expect( lambda { airport.land_plane(plane) }).to raise_error('It is too stormy to land the plane')
		end

	end

	context 'traffic control' do

		it 'should allow setting of default capacity when initialized' do
			expect(airport.capacity).to eq(12)
		end

		it 'should know if it is full' do
			allow(plane).to receive(:land!)
			allow(airport).to receive(:stormy?) { false }
  			12.times { airport.land_plane(plane) }
  			expect(airport).to be_full
		end

		it 'should not allow a plane to land if it is full' do
			allow(plane).to receive(:land!)
			allow(airport).to receive(:stormy?) { false }
  			12.times { airport.land_plane(plane) }
  			expect( lambda { airport.land_plane(plane) }).to raise_error('There are no slots available at this airport')
		end

		it 'should not allow a plane to be dispatched if the airport is empty' do
			expect( lambda { airport.dispatch_plane(plane) }).to raise_error('There are no planes to dispatch')
		end

	end

end