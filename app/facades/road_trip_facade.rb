class RoadTripFacade
  def self.trip_plan(origin, destination)
    trip_plan = LocationService.trip_plan(origin, destination)
    RoadTrip.new(origin, destination, trip_plan)
  end
end