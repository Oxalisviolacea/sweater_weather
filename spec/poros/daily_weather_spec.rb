require 'rails_helper'

RSpec.describe DailyWeather do
  it 'exists' do
    attrs = { dt: 1_610_910_000,
              sunrise: 1_610_893_087,
              sunset: 1_610_928_108,
              temp: { day: 279.31, min: 272.6, max: 282.09, night: 276.63, eve: 279.05,
                      morn: 273.4 },
              feels_like: { day: 275.99, night: 273.89, eve: 275.8, morn: 269.6 },
              pressure: 1018,
              humidity: 50,
              dew_point: 261.07,
              wind_speed: 1.26,
              wind_deg: 187,
              weather: [{ id: 804, main: 'Clouds', description: 'overcast clouds', icon: '04d' }],
              clouds: 100,
              pop: 0.07,
              uvi: 1.84 }

    daily_weather = DailyWeather.new(attrs)

    expect(daily_weather).to be_a DailyWeather
    expect(daily_weather.date).to eq('2021-01-17')
    expect(daily_weather.sunrise).to eq('2021-01-17 07:18:07 -0700')
    expect(daily_weather.sunset).to eq('2021-01-17 17:01:48 -0700')
    expect(daily_weather.max_temp).to eq(282.09)
    expect(daily_weather.min_temp).to eq(272.6)
    expect(daily_weather.conditions).to eq('overcast clouds')
    expect(daily_weather.icon).to eq('04d')
  end
end
