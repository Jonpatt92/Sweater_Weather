require 'rails_helper'

RSpec.describe LocationService, type: :service do
  before :each do
    @service = LocationService.new
  end

  it 'initialize' do
    expect(@service).to be_a(LocationService)
  end

  it 'get_coordinates' do
    VCR.use_cassette('denver_location_data') do
      coordinates = { lat: 39.7392358,
                      lng: -104.990251
                    }
      location_data = @service.get_coordinates('denver,co')

      expect(location_data[:results][0][:geometry][:location]).to eq(coordinates)
    end
  end

  it 'get_location_address' do
    VCR.use_cassette('denver_forecast_data') do
      lat  = 39.7392358
      long = -104.990251
      location_data = @service.get_location_address(lat, long)

      expect(location_data[:results][1][:address_components][3][:long_name]).to eq("Denver")
      expect(location_data[:results][1][:address_components][5][:short_name]).to eq("CO")
      expect(location_data[:results][1][:address_components][6][:long_name]).to eq("United States")
    end
  end

end
