class LocationService
  def self.find_lat_lng(city_state)
    response = conn.get("/geocoding/v1/address?key=4q5RAFc0JgWH8VeU2rfymOtjFjQvLH4X&location=#{city_state}&thumbMaps=false")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results].first[:locations].first[:latLng]
  end

  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com')
  end
end
