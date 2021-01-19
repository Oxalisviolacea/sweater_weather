require 'date'
include ActionView::Helpers::DateHelper

class Api::V1::BusinessDestinationsController < ApplicationController
  def index
    start_location = params[:start_location]
    end_location = params[:end_location]

    a = end_location.split(",")
    a[1].upcase!
    a[0].capitalize!
  end_location_formatted = a.join(", ")

    drive_time = LocationService.drive_time(start_location, end_location)
    drive_time_in_s = drive_time[:route][:time]
    drive_time_hms = drive_time[:route][:formattedTime]

    drive_time_words = drive_time_hms.to_datetime.strftime("%H hours, %M minutes, and %S seconds")
    category = params[:food]
    term = 'food'
    arrival_time = DateTime.parse((Time.now + drive_time_in_s).to_s).to_time.to_i

    hourly_weather = WeatherFacade.hourly_weather(end_location)
    destination_weather = hourly_weather.min_by do |hw|
      hw.time.to_datetime.to_i - arrival_time
    end
    
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
    render json: BusinessDestinationsSerializer.format_data(drive_time_words, end_location_formatted, business, destination_weather)
  end
end