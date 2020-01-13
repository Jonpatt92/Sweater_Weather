class LocationFacade
  attr_reader :location

  def initialize(search_params)
    @search_params = search_params
    @location      = reverse_address(coordinates)
  end

  def coordinates
    @coordinates ||= service.get_coordinates(@search_params)
  end

  def reverse_address(coordinates)
    Location.new(service.get_location_address(coordinates[:lat], coordinates[:long] || coordinates[:lng]))
  end

  private

  def service
    LocationService.new
  end
end
