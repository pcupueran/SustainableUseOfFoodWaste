class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :profile, presence: true
  has_one :profile
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
