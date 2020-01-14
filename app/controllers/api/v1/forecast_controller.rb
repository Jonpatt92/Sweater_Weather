class Api::V1::ForecastController < ApplicationController
  def show
    forecast_facade = ForecastFacade.new(params[:location])

    render json: {
      type: "Forecast",
      original_search: params[:location],
      location: forecast_facade.location,
      forecast: forecast_facade.forecast
    }
  end
end
