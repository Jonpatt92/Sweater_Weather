class Api::V1::AntipodeController < ApplicationController
  def show
    origin_location = LocationFacade.new(params[:location])
    antipode_facade = AntipodeFacade.new(origin_location.coordinates)
    antipode_forecast = ForecastFacade.new(antipode_facade.antipode_coordinates)
    binding.pry
  end
end
