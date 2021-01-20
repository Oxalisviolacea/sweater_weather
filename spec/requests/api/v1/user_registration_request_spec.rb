require 'rails_helper'

describe 'User Registration API Endpoint' do
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

  it 'will return a 404 with a message if the email is taken' do
    User.create!(email: 'whatever@example.com', password: 'password', password_confirmation: 'password')

    body = {
      "email": 'whatever@example.com',
      "password": 'password',
      "password_confirmation": 'password'
    }

    headers = { 'Content_Type' => 'application/json', 'Accept' => 'application/json' }

    post '/api/v1/users', headers: headers, params: body, as: :json

    expect(response).to_not be_successful

    expect(response).to have_http_status(400)
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:error]).to eq('Email address already exists')
  end

  it "will return a 404 if the password and password confirmation don't match" do
    body = {
      "email": 'whatever@example.com',
      "password": 'password',
      "password_confirmation": 'WRONG password'
    }

    headers = { 'Content_Type' => 'application/json', 'Accept' => 'application/json' }

    post '/api/v1/users', headers: headers, params: body, as: :json

    expect(response).to_not be_successful

    expect(response).to have_http_status(400)
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:error]).to eq('Password and password confirmation do not match')
  end
end
