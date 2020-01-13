class ForecastFacade
  def initialize(coordinates)
    @lat  = coordinates[:lat]
    @lng  = coordinates[:lng]
    @long = coordinates[:long]
  end

  def weather_data
    service.get_forecast(@lat, @lng)
  end

  def antipode_weather_data
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
