class Api::V1::BackgroundController < ApplicationController
  def show
    location = params[:location]
    photo = BackgroundFacade.background_for_(location)
    render json: BackgroundSerializer.format_data(photo)
  end
end
