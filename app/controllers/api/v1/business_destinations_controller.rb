class Api::V1::BusinessDestinationsController < ApplicationController
  def show
    origin = params[:origin]
    destination = params[:destination]

    lat_lng = LocationService.find_lat_lng(destination)
    latitude = lat_lng[:lat]
    longitude = lat_lng[:lng]
    conn = Faraday.new(
      url: 'https://developers.zomato.com',
      headers: {"Content-Type" => "application/json", "user-key" => "e321d657c14b444887af50b2b28a6c2e"}
    )
    #find the cusine id
      response = conn.get("api/v2.1/cuisines?lat=#{latitude}&lon=#{longitude}")
      cuisines = JSON.parse(response.body, symbolize_names: true)
      food_category = params[:food].capitalize
      cuisine_id = ""
      cuisines[:cuisines].each do |cuisine|
        if cuisine[:cuisine][:cuisine_name] == food_category
          cuisine_id = cuisine[:cuisine][:cuisine_id]
        end
      end
    #find restaurants matching that cuisine id
    response = conn.get("api/v2.1/search") do |req|
      req.params["lat"] = latitude
      req.params["lon"] = longitude,
      req.params["cuisines"] = cuisine_id
    end

    parsed_json = JSON.parse(response.body, symbolize_names: true)
    business = parsed_json[:restaurants].first[:restaurant]
    #make business objects

    #find trip_plan
    road_trip = RoadTripFacade.trip_plan(origin, destination)
    render json: BusinessSerializer.format_json()
  end
end