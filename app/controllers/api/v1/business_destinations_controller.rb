class Api::V1::BusinessDestinationsController < ApplicationController
  def show
    origin = params[:origin]
    destination = params[:destination]
    food_category = params[:search]

    road_trip = RoadTripFacade.trip_plan(origin, destination)
    business = BusinessDestinationsFacade.find_food(destination, food_category)
    render json: BusinessDestinationsSerializer.format_data(road_trip, business)
  end
end