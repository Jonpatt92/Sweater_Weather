class TripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :trip_info,
             :destination_temperature,
             :destination_summary
end
