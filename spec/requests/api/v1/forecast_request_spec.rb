require 'rails_helper'

describe 'Forecast request' do
  it 'Can return location coordinates' do
    get "/api/v1/forecast?location=denver,co"
    expect(response).to be_successful
  end
end
