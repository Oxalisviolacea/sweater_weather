require 'rails_helper'

describe WeatherService do
  context "instance methods" do
    it "it can find the current weather for a given lat long" do
        search = WeatherService.forecasts({:lat=>39.738453, :lng=>-104.984853})
        expect(search).to be_a Hash

        current_weather = search[:current]
        expect(current_weather).to be_a Hash

        expect(current_weather).to have_key :dt
        expect(current_weather[:dt]).to be_an(Numeric)

        expect(current_weather).to have_key :sunrise
        expect(current_weather[:sunrise]).to be_an(Numeric)

        expect(current_weather).to have_key :sunset
        expect(current_weather[:sunset]).to be_an(Numeric)

        expect(current_weather).to have_key :temp
        expect(current_weather[:temp]).to be_an(Numeric)

        expect(current_weather).to have_key :feels_like
        expect(current_weather[:feels_like]).to be_an(Numeric)

        expect(current_weather).to have_key :humidity
        expect(current_weather[:humidity]).to be_an(Numeric)

        expect(current_weather).to have_key :uvi
        expect(current_weather[:uvi]).to be_an(Numeric)

        expect(current_weather).to have_key :visibility
        expect(current_weather[:visibility]).to be_an(Numeric)

        expect(current_weather).to have_key :weather
        expect(current_weather[:weather]).to be_an Array

        expect(current_weather[:weather].first).to have_key :description
        expect(current_weather[:weather].first[:description]).to be_a(String)

        expect(current_weather[:weather].first).to have_key :icon
        expect(current_weather[:weather].first[:icon]).to be_a(String)
    end

    it "it can find the hourly weather for a given lat long" do
        search = WeatherService.forecasts({:lat=>39.738453, :lng=>-104.984853})
        expect(search).to be_a Hash

        hourly_weather = search[:hourly]
        expect(hourly_weather).to be_an Array

        hourly_weather.each do |hour|
          expect(hour).to have_key :dt
          expect(hour[:dt]).to be_an(Numeric)

          expect(hour).to have_key :temp
          expect(hour[:temp]).to be_an(Numeric)

          expect(hour).to have_key :wind_speed
          expect(hour[:wind_speed]).to be_an(Numeric)

          expect(hour).to have_key :weather
          expect(hour[:weather]).to be_an Array

          expect(hour[:weather].first).to have_key :description
          expect(hour[:weather].first[:description]).to be_a(String)

          expect(hour[:weather].first).to have_key :description
          expect(hour[:weather].first[:description]).to be_a(String)

          expect(hour[:weather].first).to have_key :icon
          expect(hour[:weather].first[:icon]).to be_a(String)
      end
    end

    it "it can find the daily weather for a given lat long" do
        search = WeatherService.forecasts({:lat=>39.738453, :lng=>-104.984853})
        expect(search).to be_a Hash

        daily_weather = search[:daily]
        expect(daily_weather).to be_an Array

        daily_weather.each do |day|
          expect(day).to have_key :dt
          expect(day[:dt]).to be_an(Numeric)

          expect(day).to have_key :sunrise
          expect(day[:sunrise]).to be_an(Numeric)

          expect(day).to have_key :sunset
          expect(day[:sunset]).to be_an(Numeric)

          expect(day).to have_key :temp
          expect(day[:temp]).to be_a Hash

          expect(day[:temp]).to have_key :max
          expect(day[:temp][:max]).to be_an(Numeric)

          expect(day[:temp]).to have_key :min
          expect(day[:temp][:min]).to be_an(Numeric).or be_an(Integer)

          expect(day).to have_key :weather
          expect(day[:weather]).to be_an Array

          expect(day[:weather].first).to have_key :description
          expect(day[:weather].first[:description]).to be_a(String)

          expect(day[:weather].first).to have_key :icon
          expect(day[:weather].first[:icon]).to be_a(String)
        end
    end

    it "it does not include unnecessary data" do
      search = WeatherService.forecasts({:lat=>39.738453, :lng=>-104.984853})
      expect(search).to_not have_key :minutely
      expect(search).to_not have_key :alerts
    end
  end
end
