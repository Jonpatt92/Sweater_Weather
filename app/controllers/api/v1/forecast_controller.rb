class Api::V1::ForecastController < ApplicationController
  def show
    location = LocationFacade.new(params[:location])
    forecast = ForecastFacade.new(location.coordinates)
    forecast.weather_data
    # render locals: {

    # }
  end
end
