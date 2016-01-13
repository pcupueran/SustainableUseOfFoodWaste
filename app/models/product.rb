class Product < ActiveRecord::Base
  belongs_to :contribution, inverse_of: :products
  validates_presence_of :contribution
end
