class LocationFacade
  def initialize(location)
    @location = location
  end

  def coordinates
    @coordinates ||= service.get_coordinates(@location)
  end

  def antipode_address(coordinates)
    @city_name ||= service.get_city_name(coordinates[:lat], coordinates[:long])
  end

  private

  def service
    LocationService.new
  end
end
