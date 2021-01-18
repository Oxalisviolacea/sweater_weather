class WeatherService
  def self.forecasts(lat_lng)
    response = conn.get("/data/2.5/onecall?lat=#{lat_lng[:lat]}&lon=#{lat_lng[:lng]}&exclude=alerts,minutely&appid=3ccdb7c078b5a11a2a101756e8b198d4&unites=imperial")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org')
  end
end
