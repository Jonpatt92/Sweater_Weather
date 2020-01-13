require 'rails_helper'

describe 'Forecast request' do
  it 'Can return antipode coordinates and weather forecast' do
    get "/api/v1/antipode?location=hong kong"
    expect(response).to be_successful
  end
end
