class HourlyForecast
  attr_reader :temperature, :time, :summary, :icon

  def initialize(hourly_data, timezone)
    @time        = get_offset_time(hourly_data[:time], timezone)
    @temperature = hourly_data[:temperature]
    @summary     = hourly_data[:summary]
    @icon        = hourly_data[:icon]
  end

  def get_offset_time(time, timezone)
    tz = TZInfo::Timezone.get(timezone)
    Time.at(time, in: tz).strftime('%-l%p')
  end
end
