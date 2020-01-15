require 'rails_helper'

RSpec.describe TripService, type: :service do
  before :each do
    @service = TripService.new
  end

  it 'initialize' do
    expect(@service).to be_a(TripService)
  end

  it 'get_trip_length' do
    VCR.use_cassette('denver_to_pueblo_trip_data') do
      origin = 'denver,co'
      destination = 'pueblo,co'
      destination_coordinates = {lat: 1, long: 1}
      trip_data = @service.get_trip_data(origin, destination)

      expect(trip_data[:destination_coordinates]).to eq(destination_coordinates)
      expect(trip_data[:travel_time]).to eq('2 hours')
    end
  end
end
