class TripFacade
  # attr_reader

  def initialize(origin, destination)
    raw_trip_data = trip_data(origin, destination)

    @formatted_trip_info = { destination_coordinates: raw_trip_data[:end_location],
                                       trip_duration: raw_trip_data[:duration],
                                              origin: raw_trip_data[:start_address].delete_suffix(", USA"),
                                         destination: raw_trip_data[:end_address].delete_suffix(", USA")
                            }
  end

  def trip_data(origin, destination)
    @trip_data ||= trip_service.get_trip_data(origin, destination)[:routes][0][:legs][0]
  end

  def weather_data
    forecast_service.get_forecast(@formatted_trip_info[:destination_coordinates][:lat], @formatted_trip_info[:destination_coordinates][:lng])
  end

  def road_trip
    Trip.new(@formatted_trip_info, weather_data)
  end

  private

  def forecast_service
    ForecastService.new
  end

  def trip_service
    TripService.new
  end
end
