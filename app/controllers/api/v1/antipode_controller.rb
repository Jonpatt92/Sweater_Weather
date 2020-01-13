class Api::V1::AntipodeController < ApplicationController
  def show
    origin_location          = LocationFacade.new(params[:location])
    antipode_facade          = AntipodeFacade.new(origin_location.coordinates)
    antipode_forecast_facade = ForecastFacade.new(antipode_facade.antipode_coordinates)
    antipode_address         = origin_location.antipode_address(antipode_facade.antipode_coordinates)

    render locals: {
      type: "Antipode",
      attributes: {
        location_name: antipode_address,
        forecast: {
          summary: antipode_forecast_facade.current_forecast[:summary],
          current_temperature: antipode_forecast_facade.current_forecast[:temperature]
        },
        search_location: params[:location]
      }
    }
  end
end
