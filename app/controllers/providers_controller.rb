class ProvidersController < ApplicationController
  before_filter :authenticate_user!
  def index
    @providers = Provider.joins(:contributions).uniq
    @charity_as_json = current_user.as_json
    @providers_as_json = Contribution.providers_as_json(Provider.joins(:contributions).limit(10))
  end

  def search
    @charity_address = current_user.profile.address
    @distance = params[:distance]

    @addresses = Address.joins(:profile => :user).where("users.type = ?", "Provider")
    @addresses = Address.find_addresses_by_distance(@addresses, @charity_address, @distance)
    @eager_load_addresses = @addresses.includes(:profile => :user)

    @providers_with_contributions = Provider.joins(:contributions).uniq

    @providers = Provider.find_providers(@providers_with_contributions, @eager_load_addresses)

    @providers_as_json = Contribution.providers_as_json(@providers)
  end
end
