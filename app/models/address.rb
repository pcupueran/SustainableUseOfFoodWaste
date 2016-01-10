class Address < ActiveRecord::Base
  belongs_to :profile

  def geocode_string
    "#{door_number} #{street}, #{postcode}, #{city}, #{country}"
  end
end
