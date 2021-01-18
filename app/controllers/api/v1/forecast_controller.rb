class Api::V1::ForecastController < ApplicationController
  def show
    WeatherFacade.forecasts(params[:location])
  end
end
