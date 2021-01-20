class Api::V1::BusinessDestinationsController < ApplicationController
  def show
    origin = params[:origin]
    destination = params[:destination]
    food_category = params[:search]

    lat_lng = LocationService.find_lat_lng(destination)
    business = BusinessService.find_restaurant(lat_lng, food_category)
    # latitude = lat_lng[:lat]
    # longitude = lat_lng[:lng]

    # conn = Faraday.new(
    #   url: 'https://developers.zomato.com',
    #   headers: {"Content-Type" => "application/json", "user-key" => "e321d657c14b444887af50b2b28a6c2e"}
    # )
    # response = conn.get("api/v2.1/search?q=#{food_category}&lat=#{latitude}&lon=#{longitude}")

    # parsed_json = JSON.parse(response.body, symbolize_names: true)
    # business = parsed_json[:restaurants].first[:restaurant]

    road_trip = RoadTripFacade.trip_plan(origin, destination)
    render json: BusinessDestinationsSerializer.format_data(road_trip, business)
  end
end