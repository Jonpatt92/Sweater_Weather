class Api::V1::TripController < ApplicationController
  def create
    if User.find_by(api_key: params[:api_key])
      trip_facade = TripFacade.new(params[:origin], params[:destination])
      render json: TripSerializer.new(trip_facade.road_trip), status: 201
    else
      render json: { error: 'Invalid Credentials' }, status: 401
    end
  end
end
