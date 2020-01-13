require 'rails_helper'

describe 'Forecast request' do
  it 'Can return antipode coordinates and weather forecast' do
    get "/api/v1/antipode?location=hong kong"
    expect(response).to be_successful

    parsed_response = JSON.parse(response.body, symbolize_names: true)

    expect(parsed_response[:type]).to eq("Antipode")
    expect(parsed_response[:attributes][:location_name]).to eq("Yavi Department, Jujuy, Argentina")
    expect(parsed_response[:attributes][:forecast][:summary]).to be_kind_of(String)
    expect(parsed_response[:attributes][:forecast][:current_temperature]).to be_kind_of(Float)
    expect(parsed_response[:attributes][:search_location]).to eq('hong kong')
  end
end
