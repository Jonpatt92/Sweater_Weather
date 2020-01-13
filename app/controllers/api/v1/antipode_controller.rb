class Api::V1::AntipodeController < ApplicationController
  def show
    origin_location   = LocationFacade.new(params[:location])
    antipode_facade   = AntipodeFacade.new(origin_location.coordinates)
    antipode_forecast = ForecastFacade.new(antipode_facade.antipode_coordinates).forecast
    antipode_address  = origin_location.reverse_address(antipode_facade.antipode_coordinates)

    render json: {
      type: "Antipode",
      attributes: {
        location_name: antipode_address,
        forecast: {
          summary: antipode_forecast.current[:summary],
          current_temperature: antipode_forecast.current[:temperature]
        },
        search_location: params[:location]
      }
    }
  end
end
