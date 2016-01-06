class Contribution < ActiveRecord::Base
  has_one :booking
  belongs_to :provider
end
