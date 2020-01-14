class Api::V1::ForecastController < ApplicationController
  def show
    forecast_facade = ForecastFacade.new(params[:location])

    render json: ForecastSerializer.new(forecast_facade.forecast)
  end
end
