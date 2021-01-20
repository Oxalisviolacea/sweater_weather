class RoadTrip
  attr_reader :travel_time, :origin, :destination, :temp_at_eta, :conditions_at_eta

  def initialize(origin, destination, trip_plan, forecast)
    @travel_time = format_travel_time(trip_plan[:route][:formattedTime])
    @origin = format_location(origin)
    @destination = format_location(destination)
    @temp_at_eta = get_temp(forecast, trip_plan)
    @conditions_at_eta = get_conditions(forecast, trip_plan)
  end

  def format_travel_time(travel_time)
    travel_time.to_datetime.strftime('%H hours %M minutes')
  end

  def format_location(location)
    location_arr = location.split(',')
    city = location_arr[0].capitalize!
    state = location_arr[1].upcase!
    city + ", " + state
  end

  def eta(forecast, trip_plan)
    drive_time_seconds = trip_plan[:route][:time]
    no_zon_now = DateTime.now.strftime('%a, %d %b %Y %H:%M:%S').to_datetime
    arrival_time = no_zon_now.advance(seconds: drive_time_seconds)
    forecast.min_by do |weather_for_hour|
      (arrival_time - weather_for_hour.time.to_datetime).abs
    end
  end

  def get_temp(forecast, trip_plan)
    forecast_for_eta = eta(forecast, trip_plan)
    forecast_for_eta.temp.to_i
  end

  def get_conditions(forecast, trip_plan)
    forecast_for_eta = eta(forecast, trip_plan)
    forecast_for_eta.conditions
  end
end
