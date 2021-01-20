class Api::V1::SessionsController < ApplicationController
  def show
    user = User.find_by(email: params[:email])
    pw_info = JSON.parse(request.body.read, symbolize_names: true)
    if user && user.authenticate(pw_info[:password])
      render json: UserSerializer.format_data(user)
    else
      render json: {
        error: 'Credentials are bad',
        status: 400
      }, status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
