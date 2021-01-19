class RoadTripSerializer
  def self.format_data(road_trip)
    {
      "data": {
        "type": 'users',
        "id": user.id,
        "attributes": {
          "email": user.email,
          "api_key": user.api_key
        }
      }
    }
  end
end