class Api::V1::ForecastController < ApplicationController
  def show
    location = params[:location]
    current = WeatherFacade.current_weather(location)
    daily = WeatherFacade.daily_weather(location)
    hourly = WeatherFacade.hourly_weather(location)
    render json: ForecastSerializer.format_data(current, daily, hourly)
  end
end
