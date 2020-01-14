class ForecastService
  def get_forecast(lat, long)
    response = fetch_data("/forecast/#{ENV['FORECAST_API_KEY']}/#{lat},#{long}")
    binding.pry
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
    Faraday.new(url: "https://api.darksky.net") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
