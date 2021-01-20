class BusinessService
  def self.find_restaurant(lat_lng, food_category)
    latitude = lat_lng[:lat]
    longitude = lat_lng[:lng]
    response = conn.get("api/v2.1/search?q=#{food_category}&lat=#{latitude}&lon=#{longitude}")

    parsed_json = JSON.parse(response.body, symbolize_names: true)
    parsed_json[:restaurants].first[:restaurant]
  end

  def self.conn
    Faraday.new(
      url: 'https://developers.zomato.com',
      headers: {"Content-Type" => "application/json", "user-key" => "e321d657c14b444887af50b2b28a6c2e"}
    )
  end
end