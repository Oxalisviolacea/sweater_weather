class Api::V1::BusinessDestinationsController < ApplicationController
  def show
    origin = params[:origin]
    destination = params[:destination]
    food_category = params[:search]

    lat_lng = LocationService.find_lat_lng(destination)
    business_info = BusinessService.find_restaurant(lat_lng, food_category)
    business = Business.new(business_info)
    road_trip = RoadTripFacade.trip_plan(origin, destination)
    render json: BusinessDestinationsSerializer.format_data(road_trip, business)
  end
end