class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location,
             :current_time,
             :current_summary,
             :day_summary,
             :temperature,
             :todays_high,
             :todays_low,
             :feels_like,
             :humidity,
             :visibility,
             :uv_index,
             :hourly_forecast,
             :daily_forecast
end
