class Address < ActiveRecord::Base
  belongs_to :profile
  geocoded_by :geocode_string
  before_update :geocode, if: lambda { |address| address.changed? }

  def geocode_string
    "#{door_number} #{street}, #{postcode}, #{city}, #{country}"
  end

  def self.find_addresses_by_distance(addresses, referenced_address, distance)
    addresses = addresses.near([referenced_address.latitude, referenced_address.longitude], distance, :units => :km)
  end
end
