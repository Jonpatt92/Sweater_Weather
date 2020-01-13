class ForecastFacade
  def initialize(coordinates)
    @lat  = coordinates[:lat]
    @lng  = coordinates[:lng] || coordinates[:long]
  end

  def weather_data
    service.get_forecast(@lat, @lng)
  end

  def forecast
    Forecast.new(weather_data)
  end

  def current_forecast
    weather_data[:currently]
  end

  private

  def service
    ForecastService.new
  end
end
