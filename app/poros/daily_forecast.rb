class DailyForecast
  attr_reader :day, :high, :low, :precip_chance, :precip_type, :summary, :icon

  def initialize(daily_data, timezone)
    @day           = get_day(daily_data[:time], timezone)
    @icon          = daily_data[:icon]
    @summary       = daily_data[:summary]
    @high          = daily_data[:temperatureHigh]
    @low           = daily_data[:temperatureLow]
    @precip_chance = daily_data[:precipProbability]
    @precip_type   = daily_data[:precipType]
  end

  def get_day(time, timezone)
    tz = TZInfo::Timezone.get(timezone)
    Time.at(time, in: tz).strftime('%A')
  end
end
