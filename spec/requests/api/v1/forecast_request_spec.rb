require 'rails_helper'

describe "Forecast API Endpoint" do
  it "it can send the introductory information" do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    expect(json).to have_key(:data)
    expect(json[:data]).to be_a Hash
    
    expect(json[:data]).to have_key :id
    expect(json[:data][:id]).to eq(nil)

    expect(json[:data]).to have_key :type
    expect(json[:data][:type]).to eq('forecast')

    expect(json[:data]).to have_key :attributes
    expect(json[:data][:attributes]).to be_a Hash
  end

  it "it can send the current weather" do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    weather = json[:data][:attributes]

    expect(weather).to have_key :current_weather
    current_weather = weather[:current_weather]

    expect(current_weather).to have_key :datetime
    expect(current_weather[:datetime]).to be_a String

    expect(current_weather).to have_key :sunrise
    expect(current_weather[:sunrise]).to be_a String

    expect(current_weather).to have_key :sunset
    expect(current_weather[:sunset]).to be_a String

    expect(current_weather).to have_key :temperature
    expect(current_weather[:temperature]).to be_an(Numeric)

    expect(current_weather).to have_key :feels_like
    expect(current_weather[:feels_like]).to be_an(Numeric)

    expect(current_weather).to have_key :humidity
    expect(current_weather[:humidity]).to be_an(Numeric)

    expect(current_weather).to have_key :uvi
    expect(current_weather[:uvi]).to be_an(Numeric)

    expect(current_weather).to have_key :visibility
    expect(current_weather[:visibility]).to be_an(Numeric)

    expect(current_weather).to have_key :conditions
    expect(current_weather[:conditions]).to be_a String

    expect(current_weather).to have_key :icon
    expect(current_weather[:icon]).to be_a String
  end

  it "it can send the daily weather" do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    weather = json[:data][:attributes]

    expect(weather).to have_key :daily_weather
    daily_weather = weather[:daily_weather]

    daily_weather.each do |dw|
      expect(dw).to have_key :date
      expect(dw[:date]).to be_a String

      expect(dw).to have_key :sunrise
      expect(dw[:sunrise]).to be_a String

      expect(dw).to have_key :sunset
      expect(dw[:sunset]).to be_a String

      expect(dw).to have_key :max_temp
      expect(dw[:max_temp]).to be_an(Numeric)

      expect(dw).to have_key :min_temp
      expect(dw[:min_temp]).to be_an(Numeric)

      expect(dw).to have_key :conditions
      expect(dw[:conditions]).to be_a String
    end
  end

  it "it can send the hourly weather" do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    weather = json[:data][:attributes]

    expect(weather).to have_key :hourly_weather
    daily_weather = weather[:hourly_weather]
    
    daily_weather.each do |dw|
      expect(dw).to have_key :time
      expect(dw[:time]).to be_a String

      expect(dw).to have_key :temp
      expect(dw[:temp]).to be_an(Numeric)

      expect(dw).to have_key :wind_speed
      expect(dw[:wind_speed]).to be_an(Numeric)

      expect(dw).to have_key :wind_direction
      expect(dw[:wind_direction]).to be_a String

      expect(dw).to have_key :conditions
      expect(dw[:conditions]).to be_a String
    end
  end
end