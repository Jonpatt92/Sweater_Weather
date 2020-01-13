class Forecast
  attr_reader :current, :hourly
  def initialize(weather_data)
    @current = weather_data[:currently]
    @hourly  = weather_data[:hourly]
  end
end
