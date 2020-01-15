class Image
  attr_reader :image_url

  def initialize(search_location)
    @image_url = service.get_image(search_location)[:urls][:full]
  end

  private

  def service
    ImageService.new
  end
end
