class Api::V1::SessionsController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
      render json: UserSerializer.format_data(User.last)
    else
      render json: {
        error: 'Invalid email or password',
        status: 400
      }, status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end