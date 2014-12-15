require 'airport'

describe Airport do 

	let(:airport) {Airport.new(:capacity => 12, stormy?: false)}
	let(:plane) {double :plane, land!: true, dispatch!: true}
	let(:weather) {double :weather}

	context 'dispatching and landing planes' do

		it 'should reduce the plane count when a plane has been dispatched' do
			airport.land_plane(plane)
			expect{ airport.dispatch_plane(plane) }.to change(airport, :plane_count).from(1).to(0)
		end

		it 'should increase the plane count when a plane has landed' do
			expect{ airport.land_plane(plane) }.to change(airport, :plane_count).from(0).to(1)
		end

		it 'should not land a plane if it is stormy' do
			allow(airport).to receive(:stormy?) { true }
			expect( lambda { airport.land_plane(plane) }).to raise_error('It is too stormy to land the plane')
		end

		it 'should not allow a plane to be dispatched if it is stormy' do
			allow(airport).to receive(:stormy?) { true }
			expect( lambda { airport.dispatch_plane(plane) }).to raise_error('It is too stormy to dispatch the plane')
		end

	end

	context 'traffic control' do

		it 'should allow setting of default capacity when initialized' do
			expect(airport.capacity).to eq(12)
		end

		it 'should know if it is full' do
  			12.times { airport.land_plane(plane) }
  			expect(airport).to be_full
		end

		it 'should not allow a plane to land if it is full' do
  			12.times { airport.land_plane(plane) }
  			expect( lambda { airport.land_plane(plane) }).to raise_error('There are no slots available at this airport')
		end

		it 'should not allow a plane to be dispatched if the airport is empty' do
			expect( lambda { airport.dispatch_plane(plane) }).to raise_error('There are no planes to dispatch')
		end

	end

end