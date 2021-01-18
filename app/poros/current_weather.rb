class CurrentWeather
  attr_reader :datetime, :sunrise, :sunset, :temp, :feels_like, :humidity, :uvi,
              :visibility, :conditions, :icon

  def initialize(attributes)
    @datetime = Time.at(attributes[:dt]).to_s
    @sunrise = Time.at(attributes[:sunrise]).to_s
    @sunset = Time.at(attributes[:sunset]).to_s
    @temp = attributes[:temp].to_f
    @feels_like = attributes[:feels_like].to_f
    @humidity = attributes[:humidity]
    @uvi = attributes[:uvi]
    @visibility = attributes[:visibility]
    @conditions = attributes[:weather].first[:description]
    @icon = attributes[:weather].first[:icon]
  end
end
