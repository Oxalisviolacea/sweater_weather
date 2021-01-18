class ForecastSerializer
  def self.format_data(current, daily, hourly)
    {
      "data": {
        "id": nil,
        "type": "forecast",
        "attributes": {
          "current_weather": current_weather(current),
          "daily_weather": daily_weather(daily),
          "hourly_weather": hourly_weather(hourly)
        }
      }
    }
  end

  def self.current_weather(current)
    {
      "datetime": current.datetime,
      "sunrise": current.sunrise,
      "sunset": current.sunset,
      "temperature": current.temp,
      "feels_like": current.feels_like,
      "humidity": current.humidity,
      "uvi": current.uvi,
      "visibility": current.visibility,
      "conditions": current.conditions,
      "icon": current.icon
    }
  end

  def self.daily_weather(daily)
    daily.map do |day|
      {
        "date": day.date,
        "sunrise": day.sunrise,
        "sunset": day.sunset,
        "max_temp": day.max_temp,
        "min_temp": day.min_temp,
        "conditions": day.conditions,
        "icon": day.icon
      }
    end
  end

  def self.hourly_weather(hourly)
    hourly.map do |hour|
      {
        "time": hour.time,
        "temp": hour.temp,
        "wind_speed": hour.wind_speed,
        "wind_direction": hour.wind_direction,
        "conditions": hour.conditions,
        "icon": hour.icon
      }
    end
  end
end
