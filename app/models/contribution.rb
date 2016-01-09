class Contribution < ActiveRecord::Base
  has_one :booking
  belongs_to :user
  has_many :products
  accepts_nested_attributes_for :products
  validates :collection_date, presence: :true
end
