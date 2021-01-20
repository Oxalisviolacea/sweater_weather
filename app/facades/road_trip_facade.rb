class RoadTripFacade
  def self.trip_plan(origin, destination)
    trip_plan = LocationService.trip_plan(origin, destination)
    forecast = WeatherFacade.hourly_weather(destination)
    RoadTrip.new(origin, destination, trip_plan, forecast)
  end
end