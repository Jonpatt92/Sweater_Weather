class Trip
  attr_reader :id, :trip_info, :destination_temperature, :destination_summary
  
  def initialize(trip_info, weather_data)
    @id                      = 1
    @trip_info               = trip_info
    @destination_temperature = weather_data[:currently][:temperature]
    @destination_summary     = weather_data[:currently][:summary]
  end
end
