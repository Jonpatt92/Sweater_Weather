class LocationService
  def get_coordinates(location)
    response = fetch_data("/maps/api/geocode/json?address=#{location}")
    parse_data(response)[:results][0][:geometry][:location]
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
