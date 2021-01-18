class Api::V1::ForecastController < ApplicationController
  def show
    forecast = WeatherFacade.forecasts(params[:location])
  end
end