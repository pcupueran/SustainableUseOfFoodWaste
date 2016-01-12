class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :organization_name, presence: true
  has_one :profile
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :create_profile


  def as_json
    address = self.profile.address
    user_as_json = {
      "organizationName" => self.organization_name,
      "email" => self.email,
      "address" => address.geocode_string,
      "latitude" => address.latitude,
      "longitude" => address.longitude
    }
    user_as_json
  end

  private
  def create_profile
    Profile.create!(user: self)
  end

end
