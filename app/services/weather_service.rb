class WeatherService
  def self.forecasts(lat_lng)
    response = conn.get("/data/2.5/onecall?lat=#{lat_lng[:lat]}&lon=#{lat_lng[:lng]}&exclude=alerts,minutely&unites=imperial")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org') do |faraday|
      faraday.params['appid'] = ENV['WEATHER-API-KEY']
    end
  end
end
