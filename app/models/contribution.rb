class Contribution < ActiveRecord::Base
  has_one :booking
  belongs_to :user
  has_many :contribution_products
  has_many :products, :through => :contribution_products
  accepts_nested_attributes_for :contribution_products
end
