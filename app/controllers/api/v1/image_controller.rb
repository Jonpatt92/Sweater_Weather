class Api::V1::ImageController < ApplicationController
  def show
    image = Image.new(params[:location])
    render json: { image_url: image.image_url }
  end
end
