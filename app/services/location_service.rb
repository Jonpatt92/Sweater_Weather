class LocationService
  def get_coordinates(location)
    response = fetch_data("/maps/api/geocode/json?address=#{location}")
    parse_data(response)
  end

  def get_location_address(lat, long)
    response = fetch_data("/maps/api/geocode/json?latlng=#{lat},#{long}")
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
    Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.params[:key] = ENV['MAP_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end
end
