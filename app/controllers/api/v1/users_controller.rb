class Api::V1::UsersController < ApplicationController
  def create
    if params[:password] != params[:password_confirmation]
      render json: {
        error: 'Password and password confirmation do not match',
        status: 400
      }, status: 400
    elsif User.find_by(email: params[:email])
      render json: {
            error: 'Email address already exists',
            status: 400
          }, status: 400
    else
      user = User.create(user_params)
      render json: UserSerializer.format_data(user)
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
