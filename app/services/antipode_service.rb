class AntipodeService
  def get_antipode_coordinates(lat, long)
    response = fetch_data("/api/v1/antipodes?lat=#{lat}&long=#{long}")
    parse_data(response)[:data][:attributes]
  end

  private

  def parse_data(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def fetch_data(url)
    connection.get(url)
  end

  def connection
    Faraday.new(url: "http://amypode.herokuapp.com") do |faraday|
      faraday.headers["API_KEY"] = ENV['ANTIPODE_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end
end
