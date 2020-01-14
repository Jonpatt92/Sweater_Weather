class Api::V1::ForecastController < ApplicationController
  def show
    location_facade = LocationFacade.new(params[:location])
    forecast = ForecastFacade.new(location_facade.coordinates).forecast
    location = location_facade.location

    render json: {
      type: "Forecast",
      original_search: params[:location],
      location: location,
      forecast: forecast
    }
  end
end
