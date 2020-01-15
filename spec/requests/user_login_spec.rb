require 'rails_helper'

RSpec.describe 'When a returning user submits email and password' do
  before(:all) do
    User.destroy_all
    @user = User.create(email: 'email@example.com', password: "password", password_confirmation: "password")
  end

  it 'Can return their api key' do
    post "/api/v1/sessions", :params => {email: "email@example.com", password: "password" }

    expect(response.status).to eq(201)
    expect(response.body).to include(@user.api_key)
  end

  it 'Can refuse access for incorrect credentials' do
    post "/api/v1/sessions", :params => {email: "email@example.com", password: "wrong_pass" }

    expect(response.status).to eq(401)
    expect(response.body).to_not include(@user.api_key)
  end
end
