class Contribution < ActiveRecord::Base
  has_one :booking
  belongs_to :user

  has_many :products, inverse_of: :contribution
  accepts_nested_attributes_for :products, allow_destroy: :true, reject_if: proc { |attributes| attributes[:product_name].blank? }

  validates :collection_date, :collection_time, presence: :true
  validate :must_have_one_product, :collection_date_validity

  def self.providers_as_json(providers)
    providers_json = []

    providers.each do |provider|
      providers_json << provider.as_json
    end
    providers_json
  end

  def must_have_one_product
    if products.empty?
      errors.add(:products, "must have at least one product") if products.empty?
      self.products << Product.new
    end
  end

  def collection_date_validity
    errors.add(:collection_date, "cannot be in the past") if collection_date < Date.today
  end

  def self.list_contributions(providers)
    contributions = []
    providers.each do |provider|
      contributions << provider.contributions[0]
    end
    contributions
  end
end
