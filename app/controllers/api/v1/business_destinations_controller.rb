require 'date'

class Api::V1::BusinessDestinationsController < ApplicationController
  def index
    start_location = params[:start_location]
    end_location = params[:end_location]


    drive_time = LocationService.drive_time(start_location, end_location)
    seconds = drive_time % 60
    minutes = (drive_time / 60) % 60
    hours = drive_time / (60 * 60)
    time = format("%02d:%02d:%02d", hours, minutes, seconds)
    category = params[:food]
    term = 'food'
    arrival_time = DateTime.parse((Time.now + drive_time).to_s).to_time.to_i

    daily_weather = WeatherFacade.daily_weather(end_location)

    conn = Faraday.new('https://api.yelp.com') do |f|
      f.headers['Authorization'] = ENV['YELP_API_KEY']
    end

    response = conn.get("/v3/businesses/search") do |f|
			f.params[:location] = end_location
      f.params[:category] = category
      f.params[:open_at] = arrival_time
      f.params[:term] = term
    end
    
    parsed_json = JSON.parse(response.body, symbolize_names: true)
    business = parsed_json[:businesses].first
    render json: BusinessDestinationsSerializer.format_data(time, business, daily_weather, end_location)
  end
end