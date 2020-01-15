require 'rails_helper'

RSpec.describe 'Forecast request' do
  it 'Can return location details' do
    VCR.use_cassette('denver_forecast_data') do
      get "/api/v1/forecast?location=denver,co"
      expect(response).to be_successful

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response[:data][:type]).to eq("forecast")
      expect(parsed_response[:data][:attributes][:location][:original_search]).to eq("denver,co")
      expect(parsed_response[:data][:attributes][:location][:city]).to eq("Denver")
      expect(parsed_response[:data][:attributes][:location][:state]).to eq("CO")
      expect(parsed_response[:data][:attributes][:location][:country]).to eq("United States")
    end
  end

  it 'Can return current forecast details' do
    VCR.use_cassette('denver_forecast_data') do
      get "/api/v1/forecast?location=denver,co"
      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response[:data][:attributes][:current_time]).to eq("6:37 PM, 1/14")
      expect(parsed_response[:data][:attributes][:current_summary]).to eq("Clear")
      expect(parsed_response[:data][:attributes][:day_summary]).to eq("Clear throughout the day.")
      expect(parsed_response[:data][:attributes][:temperature]).to eq(44.2)
      expect(parsed_response[:data][:attributes][:todays_high]).to eq(58.87)
      expect(parsed_response[:data][:attributes][:todays_low]).to eq(21.77)
      expect(parsed_response[:data][:attributes][:feels_like]).to eq(44.48)
      expect(parsed_response[:data][:attributes][:humidity]).to eq(0.21)
      expect(parsed_response[:data][:attributes][:visibility]).to eq(10)
      expect(parsed_response[:data][:attributes][:uv_index]).to eq(0)
    end
  end

  it 'Can return hourly forecast details' do
    VCR.use_cassette('denver_forecast_data') do
      get "/api/v1/forecast?location=denver,co"
      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response[:data][:attributes][:hourly_forecast].count).to eq(8)
      expect(parsed_response[:data][:attributes][:hourly_forecast][0][:time]).to eq("6PM")
      expect(parsed_response[:data][:attributes][:hourly_forecast][0][:temperature]).to eq(46.22)
      expect(parsed_response[:data][:attributes][:hourly_forecast][0][:summary]).to eq("Clear")
      expect(parsed_response[:data][:attributes][:hourly_forecast][0][:icon]).to eq("clear-night")
    end
  end

  it 'Can return daily forecast details' do
    VCR.use_cassette('denver_forecast_data') do
      get "/api/v1/forecast?location=denver,co"
      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response[:data][:attributes][:daily_forecast].count).to eq(5)
      expect(parsed_response[:data][:attributes][:daily_forecast][0][:day]).to eq("Tuesday")
      expect(parsed_response[:data][:attributes][:daily_forecast][1][:day]).to eq("Wednesday")
      expect(parsed_response[:data][:attributes][:daily_forecast][0][:icon]).to eq("clear-day")
      expect(parsed_response[:data][:attributes][:daily_forecast][0][:summary]).to eq("Clear throughout the day.")
      expect(parsed_response[:data][:attributes][:daily_forecast][0][:high]).to eq(58.87)
      expect(parsed_response[:data][:attributes][:daily_forecast][0][:low]).to eq(21.77)
      expect(parsed_response[:data][:attributes][:daily_forecast][0][:precip_chance]).to eq(0.03)
      expect(parsed_response[:data][:attributes][:daily_forecast][0][:precip_type]).to eq("snow")
    end
  end
end
