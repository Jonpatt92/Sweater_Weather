class LocationFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def coordinates
    @coordinates ||= service.get_coordinates(@location)
  end

  def reverse_address(coordinates)
    @city_name ||= service.get_city_name(coordinates[:lat], coordinates[:long] || coordinates[:lng])
  end

  private

  def service
    LocationService.new
  end
end
