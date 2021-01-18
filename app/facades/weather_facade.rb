class WeatherFacade
  def self.forecasts(city_state)
    lat_lng = LocationService.find_lat_lng(city_state)
    forecasts = WeatherService.forecasts(lat_lng)

    CurrentWeather.new(forecasts[:current])

    forecasts[:daily].each do |daily_forecast|
      DailyWeather.new(daily_forecast)
    end

    forecasts[:hourly].each do |hourly_forecast|
      HourlyWeather.new(hourly_forecast)
    end
  end
end