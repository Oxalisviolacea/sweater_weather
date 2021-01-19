require 'rails_helper'

describe 'Road Trip API Endpoint' do
  it 'it can send information about the road trip' do
        body = {
                  "origin": "Denver,CO",
                  "destination": "Pueblo,CO",
                  "api_key": "jgn983hy48thw9begh98h4539h4"
                }

    headers = { 'Content_Type' => 'application/json', 'Accept' => 'application/json' }

    post '/api/v1/road_trip', headers: headers, params: body, as: :json

    expect(response).to be_successful

    background = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(background).to have_key :data
    expect(background[:data]).to be_a Hash

    expect(background[:data]).to have_key :type
    expect(background[:data][:type]).to be_a String
    expect(background[:data][:type]).to eq('roadtrip')

    expect(background[:data]).to have_key :id
    expect(background[:data][:id]).to eq(nil)

    expect(background[:data]).to have_key :attributes
    expect(background[:data][:attributes]).to be_a Hash

    expect(background[:data][:attributes]).to have_key :start_city
    expect(background[:data][:attributes][:start_city]).to be_a Hash
    expect(background[:data][:attributes][:start_city]).to eq(body[:origin])

    expect(background[:data][:attributes]).to have_key :end_city
    expect(background[:data][:attributes][:end_city]).to be_a Hash
    expect(background[:data][:attributes][:start_city]).to eq(body[:destination])

    expect(background[:data][:attributes]).to have_key :travel_time
    expect(background[:data][:attributes][:travel_time]).to be_a String

    expect(background[:data][:attributes]).to have_key :weather_at_eta
    expect(background[:data][:attributes][:weather_at_eta]).to be_a Hash

    expect(background[:data][:attributes][:weather_at_eta]).to have_key :temperature
    expect(background[:data][:attributes][:weather_at_eta][:temperature]).to be_an Integer

    expect(background[:data][:attributes][:weather_at_eta]).to have_key :conditions
    expect(background[:data][:attributes][:weather_at_eta][:conditions]).to be_an String
  end
end