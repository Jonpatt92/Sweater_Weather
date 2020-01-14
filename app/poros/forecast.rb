class Forecast
  attr_reader :current_time, :hourly_forecast, :daily_forecast, :current_summary, :day_summary, :temperature, :high, :low, :feels_like, :humidity, :visibility, :uv_index

  def initialize(weather_data)
    @current_time    = get_offset_time(weather_data[:currently][:time], weather_data[:timezone])
    @current_summary = weather_data[:currently][:summary]
    @day_summary     = weather_data[:daily][:data][0][:summary]
    @temperature     = weather_data[:currently][:temperature]
    @todays_high     = weather_data[:daily][:data][0][:temperatureHigh]
    @todays_low      = weather_data[:daily][:data][0][:temperatureLow]
    @feels_like      = weather_data[:currently][:apparentTemperature]
    @humidity        = weather_data[:currently][:humidity]
    @visibility      = weather_data[:currently][:visibility]
    @uv_index        = weather_data[:currently][:uvIndex]
    @hourly_forecast = create_hourly_forecast(weather_data[:hourly][:data][0..7], weather_data[:timezone])
    @daily_forecast  = create_daily_forecast(weather_data[:daily][:data][0..4], weather_data[:timezone])
  end

  def create_hourly_forecast(hourly_data, timezone)
    hourly_data.map do |hour_data|
      HourlyForecast.new(hour_data, timezone)
    end
  end

  def create_daily_forecast(daily_data, timezone)
    daily_data.map do |day_data|
      DailyForecast.new(day_data, timezone)
    end
  end

  def get_offset_time(time, timezone)
    tz = TZInfo::Timezone.get(timezone)
    Time.at(time, in: tz).strftime('%-l:%M %p, %-m/%d')
  end
end
