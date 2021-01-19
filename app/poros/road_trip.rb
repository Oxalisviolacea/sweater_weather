class RoadTrip
  attr_reader :travel_time, :origin, :destination
  
  def initialize(origin, destination, trip_plan)
    @travel_time = format_travel_time(trip_plan[:route][:formattedTime])
    @origin = format_location(origin)
    @destination = format_location(destination)
  end

  def format_travel_time(travel_time)
    travel_time.to_datetime.strftime("%H hours and %M minutes")
  end

  def format_location(location)
    location.split(",")
    location[1].upcase!
    location[0].capitalize!
    location.join(", ")
  end
end