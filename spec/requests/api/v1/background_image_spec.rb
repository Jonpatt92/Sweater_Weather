require 'rails_helper'

RSpec.describe 'Forecast request' do
  it 'Can return location details' do
    VCR.use_cassette('denver_image_data') do
      get "/api/v1/backgrounds?location=denver,co"
      expect(response).to be_successful

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response[:url]).to include('.com')
      expect(parsed_response[:url]).to include('http')
    end
  end
end
