require 'rails_helper'

describe 'User Login API Endpoint' do
  it 'can create a new user' do

    user1 = User.create!(email: 'whatever@example.com', password: 'password', password_confirmation: 'password')
    user2 = User.create!(email: "whatev@ex.com", password: 'pw', password_confirmation: 'pw')
    body = {
              "email": "whatever@example.com",
              "password": "password"
            }

    headers = { 'Content_Type' => 'application/json', 'Accept' => 'application/json' }

    post '/api/v1/sessions', headers: headers, params: body, as: :json

    expect(response).to be_successful

    user_response = JSON.parse(response.body, symbolize_names: true)

    expect(user_response).to have_key :data
    expect(user_response[:data]).to be_a Hash

    expect(user_response[:data]).to have_key :type
    expect(user_response[:data][:type]).to be_a String
    expect(user_response[:data][:type]).to eq('users')

    expect(user_response[:data]).to have_key :id
    expect(user_response[:data][:id]).to be_a Integer
    expect(user_response[:data][:id]).to eq(user1.id)

    expect(user_response[:data]).to have_key :attributes
    expect(user_response[:data][:attributes]).to be_a Hash

    expect(user_response[:data][:attributes]).to have_key :email
    expect(user_response[:data][:attributes][:email]).to be_a String
    expect(user_response[:data][:attributes][:email]).to eq(user1.email)

    expect(user_response[:data][:attributes]).to have_key :api_key
    expect(user_response[:data][:attributes][:api_key]).to be_a String
    expect(user_response[:data][:attributes][:api_key]).to eq(user1.api_key)
  end
end