require 'rails_helper'

describe 'User API Endpoint' do
  it 'can create a new user' do
    body = {
      "email": 'whatever@example.com',
      "password": 'password',
      "password_confirmation": 'password'
    }

    headers = { 'Content_Type' => 'application/json', 'Accept' => 'application/json' }

    post '/api/v1/users', headers: headers, params: body, as: :json

    created_user = User.last
    expect(created_user.email).to eq(body[:email])
    expect(created_user.password_digest).should_not be_nil
    expect(created_user.api_key).should_not be_nil

    expect(response).to be_successful

    user_response = JSON.parse(response.body, symbolize_names: true)

    expect(user_response).to have_key :data
    expect(user_response[:data]).to be_a Hash

    expect(user_response[:data]).to have_key :type
    expect(user_response[:data][:type]).to be_a String
    expect(user_response[:data][:type]).to eq('users')

    expect(user_response[:data]).to have_key :id
    expect(user_response[:data][:id]).to eq(created_user.id)
  end
end
