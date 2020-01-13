class Location
  attr_reader :city, :state, :country

  def initialize(location_data)
    @city    = find_city(location_data)
    @state   = find_state(location_data)
    @country = find_country(location_data)
  end

  def find_city(location_data)
    location_data[:address_components].each do |address_row|
      return address_row[:long_name] if address_row[:types].any?("locality")
    end
  end

  def find_state(location_data)
    location_data[:address_components].each do |address_row|
      return address_row[:short_name] if address_row[:types].any?("administrative_area_level_1")
    end
  end

  def find_country(location_data)
    location_data[:address_components].each do |address_row|
      return address_row[:long_name] if address_row[:types].any?("country")
    end
  end
end
