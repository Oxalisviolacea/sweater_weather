class Api::V1::RoadTripsController < ApplicationController
  def show
    origin = params[:origin]
    destination = params[:destination]
    road_trip = RoadTripFacade.trip_plan(origin, destination)
    render json: RoadTripSerializer.format_data(road_trip)
  end
end