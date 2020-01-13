class LocationFacade
  def initialize(location)
    @location = location
  end

  def coordinates
    @coordinates ||= service.get_coordinates(@location)
  end

  private

  def service
    LocationService.new
  end
end
