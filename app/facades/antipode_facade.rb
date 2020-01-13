class AntipodeFacade
  def initialize(origin_coordinates)
    @origin_lat = origin_coordinates[:lat]
    @origin_long = origin_coordinates[:lng]
  end

  def antipode_coordinates
    @antipode_coordinates ||= service.get_antipode_coordinates(@origin_lat, @origin_long)
  end

  private

  def service
    AntipodeService.new
  end
end
