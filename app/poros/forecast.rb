class Forecast
  attr_reader :current, :hourly

  def initialize(weather_data)
    binding.pry
    @current = weather_data[:currently]
    @hourly  = weather_data[:hourly]
    @daily   = weather_data[:daily]
  end

  def summary
    binding.pry
  end

  def high
    binding.pry
  end

  def low
    binding.pry
  end

  def feels_like
    binding.pry
  end

  def humidity
    binding.pry
  end

  def visibility
    binding.pry
  end

  def uv_index
    binding.pry
  end
end
