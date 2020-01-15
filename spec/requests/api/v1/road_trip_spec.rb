require 'rails_helper'

RSpec.describe 'Road Trip request' do
  before(:all) do
    User.destroy_all
    @user = User.create(email: 'email@example.com', password: "password", password_confirmation: "password")
  end
  it 'Can return road trip details' do
    VCR.use_cassette('denver_to_pueblo_road_trip_data') do
      post "/api/v1/road_trip", :params => { origin: "Denver,CO",
                                            destination: "Pueblo,CO",
                                            api_key: @user.api_key
                                           }
      expect(response).to be_successful

      trip_data = JSON.parse(response.body, symbolize_names: true)

      expect(trip_data[:data][:origin]).to eq("Denver, CO")
      expect(trip_data[:data][:destination]).to eq("Pueblo, CO")
      expect(trip_data[:data][:travel_time]).to eq('2 hours')
      expect(trip_data[:data][:arrival_forecast][:temperature]).to eq(74)
      expect(trip_data[:data][:arrival_forecast][:summary]).to eq('Mostly Sunny')
    end
  end

  it 'Wont allow incorrect api_key' do
      post "/api/v1/road_trip", :params => { origin: "Denver,CO",
                                            destination: "Pueblo,CO",
                                            api_key: '3kjfdsj332dfa'
                                           }
      expect(response.status).to eq(401)
  end

  it 'Wont allow absence of api_key' do
      post "/api/v1/road_trip", :params => { origin: "Denver,CO",
                                            destination: "Pueblo,CO"
                                           }
      expect(response.status).to eq(401)
  end
end
