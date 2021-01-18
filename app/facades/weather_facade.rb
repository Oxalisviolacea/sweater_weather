class WeatherFacade
  def self.forecasts(city_state)
    lat_lng = LocationService.find_lat_lng(city_state)
    WeatherService.forecasts(lat_lng)
  end

  def self.current_weather(city_state)
    CurrentWeather.new(forecasts(city_state)[:current])
  end

  def self.daily_weather(city_state)
    forecasts(city_state)[:daily].map do |daily_forecast|
      DailyWeather.new(daily_forecast)
    end
  end

  def self.hourly_weather(city_state)
    forecasts(city_state)[:hourly].map do |hourly_forecast|
      HourlyWeather.new(hourly_forecast)
    end
  end
end
