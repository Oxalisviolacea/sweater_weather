class LocationService
  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com') do |faraday|
      faraday.params['key'] = ENV['LOCATION-API-KEY']
    end
  end

  def self.drive_time(start_location, end_location)
    response = conn.get("/directions/v2/route?to=#{start_location}&from=#{end_location}")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:route][:time]
  end

  def self.find_lat_lng(city_state)
    response = conn.get("/geocoding/v1/address?location=#{city_state}&thumbMaps=false")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results].first[:locations].first[:latLng]
  end
end
