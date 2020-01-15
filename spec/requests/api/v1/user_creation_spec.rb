require 'rails_helper'

RSpec.describe 'When a new user submits email and password' do
  before(:all) do
    User.destroy_all
  end
  it 'Can return an api key' do
    post "/api/v1/users", :params => { email: "email@example.com",
                                        password: "password",
                                        password_confirmation: "password"
                                      }
    user = User.last

    expect(response.status).to eq(201)
    expect(response.body).to include(user.api_key)
  end

  it 'Must be a unique email' do
    User.create(email: 'email@example.com', password: "password", password_confirmation: "password")

    post "/api/v1/users", :params => {email: "email@example.com",
                                        password: "password",
                                        password_confirmation: "password"
                                      }

    expect(response.status).to eq(401)
    expect(response.body).to include("Email has already been taken")
  end

  it 'Password must match' do
    post "/api/v1/users", :params => {email: "email@example.com",
                                        password: "pass",
                                        password_confirmation: "password"
                                      }

    expect(response.status).to eq(401)
    expect(response.body).to include("Password confirmation doesn't match Password")
  end
end
