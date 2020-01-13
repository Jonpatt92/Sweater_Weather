class ForecastFacade
  def initialize(coordinates)
    @lat = coordinates[:lat]
    @long = coordinates[:lng]
  end

  def weather_data
    service.get_forecast(@lat, @long)
  end

  def current_forecast
    weather_data[:currently]
  end

  private

  def service
    ForecastService.new
  end
end
