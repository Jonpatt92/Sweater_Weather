require 'rails_helper'

describe 'Forecast request' do
  it 'Can return location coordinates' do
    get "/api/v1/forecast?location=denver,co"
    expect(response).to be_successful

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response[:type]).to eq("Forecast")
    expect(parsed_response[:location][:original_search]).to eq("denver,co")
    expect(parsed_response[:location][:location_city]).to eq("Denver")
    expect(parsed_response[:location][:location_state]).to eq("CO")
    expect(parsed_response[:location][:location_country]).to eq("United States")
  end
end
