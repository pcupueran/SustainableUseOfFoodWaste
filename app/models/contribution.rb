class Contribution < ActiveRecord::Base
  has_one :booking
  belongs_to :user
  has_many :products
  accepts_nested_attributes_for :products
  validates :collection_date, :collection_time, presence: :true


  def self.providers_as_json(providers)
    providers_json = []

    providers.each do |provider|
      provider_json = provider.as_json
      providers_json << provider_json
    end

    providers_json
  end
end
