class BusinessDestinationsSerializer
  def self.format_data(road_trip, business)
    {
      "data": {
        "id": nil,
        "type": "foodie",
        "attributes": {
          "end_location": road_trip.destination,
          "travel_time": road_trip.travel_time,
          "forecast": {
            "summary": road_trip.conditions_at_eta,
            "temperature": road_trip.temp_at_eta
          },
          "restaurant": {
            "name": business.name,
            "address": business.address
          }
        }
      }
    }
  end
end
