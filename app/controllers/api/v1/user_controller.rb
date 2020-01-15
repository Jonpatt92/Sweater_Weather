class Api::V1::UserController < ApplicationController
  def show
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      render json: { api_key: user.api_key }, status: 201
    else
      render json: { error: 'Invalid Email or Password' }, status: 401
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: { api_key: user.api_key }, status: 201
    else
      render json: { error: user.errors.full_messages.to_sentence }, status: 401
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
