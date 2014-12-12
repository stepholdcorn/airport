require 'plane'

describe Plane do

	let(:plane) {Plane.new}

	it 'should have a flying status when created' do
		expect(plane).to be_flying
	end

	it 'should have a flying status when it has been dispatched' do
		plane.land!
		plane.dispatch!
		expect(plane).to be_flying
	end

	it 'should not have a flying status when it has landed' do
		plane.land!
		expect(plane).not_to be_flying
	end

end