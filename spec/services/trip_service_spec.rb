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
      destination_coordinates = { lat: 38.2542053, lng: -104.6087488 }
      trip_data = @service.get_trip_data(origin, destination)

      expect(trip_data[:routes][0][:legs][0][:end_location]).to eq(destination_coordinates)
      expect(trip_data[:routes][0][:legs][0][:duration][:text]).to eq('1 hour 48 mins')
    end
  end
end
