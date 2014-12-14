require 'plane'

describe Plane do

	let(:plane) {Plane.new}

	it 'should have a flying status when created' do
		expect(plane).to be_flying
	end

	it 'should have a flying status when it has been dispatched' do
		plane.land!
		expect{ plane.dispatch! }.to change(plane, :flying?).from(false).to(true)
	end

	it 'should not have a flying status when it has landed' do
		expect{ plane.land! }.to change(plane, :flying?).from(true).to(false)
	end

end