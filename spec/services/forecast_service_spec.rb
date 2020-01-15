require 'rails_helper'

RSpec.describe ForecastService, type: :service do
  before :each do
    @service = ForecastService.new
  end

  it 'initialize' do
    expect(@service).to be_a(ForecastService)
  end

  it 'get_forecast' do
    VCR.use_cassette('denver_forecast_data') do
      lat  = 39.7392358
      long = -104.990251
      forecast_data = @service.get_forecast(lat, long)

      expect(forecast_data[:latitude]).to eq(lat)
      expect(forecast_data[:longitude]).to eq(long)
      expect(forecast_data[:currently][:summary]).to eq("Clear")
      expect(forecast_data[:currently][:temperature]).to eq(44.2)

      expect(forecast_data[:hourly][:data].count).to be > 8
      expect(forecast_data[:daily][:data].count).to be > 5
    end
  end
end
