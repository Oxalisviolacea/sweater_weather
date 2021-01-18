class HourlyWeather
  attr_reader :time, :temp, :wind_speed, :wind_direction, :conditions, :icon

  def initialize(attributes)
    @time = Time.at(attributes[:dt]).strftime('%H:%M:%S')
    @temp = attributes[:temp].to_f
    @wind_speed = attributes[:wind_speed]
    @wind_direction = cardinal_direction(attributes[:wind_deg])
    @conditions = attributes[:weather].first[:description]
    @icon = attributes[:weather].first[:icon]
  end

  def cardinal_direction(deg)
    calculation = ((deg / 22.5) + 0.5).round(0)
    conversion = { 1 => 'N', 2 => 'NNE', 3 => 'NE', 4 => 'ENE', 5 => 'E', 6 => 'ESE', 7 => 'SE', 8 => 'SSE', 9 => 'S',
                   10 => 'SSW', 11 => 'SW', 12 => 'WSW', 13 => 'W', 14 => 'WNW', 15 => 'NW', 16 => 'NNW', 17 => 'N' }
    conversion[calculation]
  end
end
