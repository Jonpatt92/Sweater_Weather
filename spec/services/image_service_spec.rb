require 'rails_helper'

RSpec.describe ImageService, type: :service do
  before :each do
    @service = ImageService.new
  end

  it 'initialize' do
    expect(@service).to be_a(ImageService)
  end

  it 'get_image' do
    VCR.use_cassette('denver_background_image_data') do
      image_data = @service.get_image('denver,co')

      expect(image_data[:url]).to include('.com')
      expect(image_data[:url]).to include('http')
    end
  end
end
