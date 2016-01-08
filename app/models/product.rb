class Product < ActiveRecord::Base
  has_many :contribution_products
  has_many :contributions, :through => :contributions_products
end
