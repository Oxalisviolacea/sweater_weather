class Api::V1::SessionsController < ApplicationController
  def show
    user = User.find_by(email: params[:email])
    if user
      render json: UserSerializer.format_data(user)
    else
      render json: {
        error: 'Invalid email or password',
        status: 400
      }, status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end