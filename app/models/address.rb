class Address < ActiveRecord::Base
  belongs_to :profile
  geocoded_by :geocode_string
  before_update :geocode, if: lambda { |address| address.changed? }

  def geocode_string
    "#{door_number} #{street}, #{postcode}, #{city}, #{country}"
  end
end
