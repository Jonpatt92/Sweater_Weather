class ForecastFacade
  attr_reader :location

  def initialize(search_params)
    @coordinates = location_coordinates(search_params)
    @location    = reverse_address(@coordinates, search_params)
  end

  def location_coordinates(search_location)
    @coordinates ||= location_service.get_coordinates(search_location)[:results][0][:geometry][:location]
  end

  def weather_data
    forecast_service.get_forecast(@coordinates[:lat], @coordinates[:lng] || @coordinates[:long])
  end

  def forecast
    Forecast.new(weather_data, @location)
  end

  def current_forecast
    weather_data[:currently]
  end

  def reverse_address(coordinates, search_params)
    Location.new(location_service.get_location_address(coordinates[:lat], coordinates[:long] || coordinates[:lng]), search_params)
  end

  private

  def forecast_service
    ForecastService.new
  end

  def location_service
    LocationService.new
  end
end
