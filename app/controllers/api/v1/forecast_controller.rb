class Api::V1::ForecastController < ApplicationController
  def show
    location_facade = LocationFacade.new(params[:location])
    forecast = ForecastFacade.new(location_facade.coordinates).forecast
    location = location_facade.location

    render json: {
      type: "Forecast",
      location: {
         original_search: params[:location],
           location_city: location.city,
          location_state: location.state,
        location_country: location.country
      },
      current_forecast: {
           summary: forecast.summary,
              high: forecast.high,
               low: forecast.low,
        feels_like: forecast.feels_like,
          humidity: forecast.humidity,
        visibility: forecast.visibility,
          uv_index: forecast.uv_index
      },
      extended_forecast: {

      },
      hourly_forecast: {

      }
    }
  end
end
