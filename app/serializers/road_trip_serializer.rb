class RoadTripSerializer
  def self.format_data(road_trip)
    {
      "data": {
        "id": nil,
        "type": 'roadtrip',
        "attributes": {
          "start_city": road_trip.origin,
          "end_city": road_trip.destination,
          "travel_time": road_trip.travel_time,
          "weather_at_eta": {
            "temperature": road_trip.temp_at_eta,
            "conditions": road_trip.conditions_at_eta
          }
        }
      }
    }
  end
end
