require 'rails_helper'

RSpec.describe HourlyWeather do
  it 'exists' do
    attrs = { dt: 1_610_920_800,
              temp: 281.77,
              feels_like: 277.62,
              pressure: 829,
              humidity: 28,
              dew_point: 265.28,
              uvi: 0.62,
              clouds: 75,
              visibility: 10_000,
              wind_speed: 1.69,
              wind_deg: 162,
              weather: [{ id: 803, main: 'Clouds', description: 'broken clouds', icon: '04d' }],
              pop: 0 }

    hourly_weather = HourlyWeather.new(attrs)

    expect(hourly_weather).to be_a HourlyWeather
    expect(hourly_weather.time).to eq('15:00:00')
    expect(hourly_weather.temp).to eq(281.77)
    expect(hourly_weather.wind_speed).to eq(1.69)
    expect(hourly_weather.wind_direction).to eq('from SSE')
    expect(hourly_weather.conditions).to eq('broken clouds')
    expect(hourly_weather.icon).to eq('04d')
  end
end
