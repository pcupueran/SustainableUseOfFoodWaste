class Profile < ActiveRecord::Base
  has_one :address
  belongs_to :user
  accepts_nested_attributes_for :address, :user

  after_create :create_address

  private
  def create_address
    Address.create!(profile: self)
  end
end
