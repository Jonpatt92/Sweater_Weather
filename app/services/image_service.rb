class ImageService
  def get_image(location)
    response = fetch_data("/photos/random?query=#{location}&orientation=landscape&featured")
    parse_data(response)
  end

  private

  def parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def fetch_data(url)
    connection.get(url)
  end

  def connection
    Faraday.new(url: "https://api.unsplash.com") do |faraday|
      faraday.params[:client_id] = ENV['IMAGE_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end
end
