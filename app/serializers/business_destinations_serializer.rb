class BusinessDestinationsSerializer
  def self.format_data(time, business, daily_weather, end_location)
    require 'pry'; binding.pry
    {
      "data": {
        "id": "nil",
        "type": "munchie",
        "attributes": {
          "destination_city": end_location,
          "travel_time": time,
          "forecast": {
            "summary": daily_weather.summary,
            "min temp": daily_weather.first.min_temp
            "max temp": daily_weather.first.max_temp
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