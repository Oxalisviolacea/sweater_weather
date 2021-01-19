class BusinessDestinationsSerializer
  def self.format_data(drive_time_words, end_location_formatted, business, destination_weather)
    {
      "data": {
        "id": nil,
        "type": "munchie",
        "attributes": {
          "destination_city": end_location_formatted,
          "travel_time": drive_time_words,
          "forecast": {
            "summary": destination_weather.conditions,
            "temperature": destination_weather.temp.to_i
          },
          "restaurant": {
            "name": business[:name],
            "address": business[:location][:address1]
          }
        }
      }
    }
  end
end