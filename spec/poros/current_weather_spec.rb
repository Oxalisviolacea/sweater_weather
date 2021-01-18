require 'rails_helper'

RSpec.describe CurrentWeather do
  it 'exists' do
    attrs = { dt: 1_610_922_772,
              sunrise: 1_610_893_087,
              sunset: 1_610_928_108,
              temp: 282.13,
              feels_like: 278.25,
              pressure: 829,
              humidity: 28,
              dew_point: 265.55,
              uvi: 0.19,
              clouds: 75,
              visibility: 10_000,
              wind_speed: 1.34,
              wind_deg: 301,
              wind_gust: 2.68,
              weather: [{ id: 803, main: 'Clouds', description: 'broken clouds', icon: '04d' }] }

    current_weather = CurrentWeather.new(attrs)

    expect(current_weather).to be_a CurrentWeather
    expect(current_weather.datetime).to eq('2021-01-17 15:32:52 -0700')
    expect(current_weather.sunrise).to eq('2021-01-17 07:18:07 -0700')
    expect(current_weather.sunset).to eq('2021-01-17 17:01:48 -0700')
    expect(current_weather.temp).to eq(282.13)
    expect(current_weather.feels_like).to eq(278.25)
    expect(current_weather.humidity).to eq(28)
    expect(current_weather.uvi).to eq(0.19)
    expect(current_weather.visibility).to eq(10_000)
    expect(current_weather.conditions).to eq('broken clouds')
    expect(current_weather.icon).to eq('04d')
  end
end
