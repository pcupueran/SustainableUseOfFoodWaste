class ContributionsController < ApplicationController
  before_action :load_contribution, :only => [:show]
  before_action :authenticate_user!
  append_before_action :restrict_access, :only => [:new]

  def new
    @contribution = Contribution.new
    @contribution.products << Product.new
  end

  def create
    @contribution = Contribution.new(user_id: params[:user_id])
    @contribution.assign_attributes(contribution_params)
    begin
      @contribution.save!
      flash[:notice] = "A contribution has been created"
      redirect_to user_contribution_path(@contribution, user_id: params[:user_id])
    rescue
      render :new
    end
  end

  def index
    render :status => 403, :text => "Forbidden User Access Please sign in as a Charity" unless current_user.type == "Charity"
    @contributions = Contribution.includes(:products)
    @charity_as_json = current_user.as_json
    @providers_as_json = Contribution.providers_as_json(Provider.joins(:contributions).limit(10))

  end

  def add_product
    Product.new
  end

  def search
    @charity_address = current_user.profile.address

    @addresses = Address.joins(:profile => :user).where("users.type = ?", "Provider")
    @distance = params[:distance]
    @addresses = Address.find_addresses_by_distance(@addresses, @charity_address, @distance)
    @eager_load_addresses = @addresses.includes(:profile => :user)

    @providers_with_contributions = Provider.joins(:contributions)

    @providers = Provider.find_providers(@providers_with_contributions, @eager_load_addresses)

    @contributions = Contribution.list_contributions(@providers)

    @providers_as_json = Contribution.providers_as_json(@providers)
  end

  private
  def contribution_params
    params.require(:contribution).permit(:collection_date, :collection_time, :products_attributes => [:quantity, :product_name, :perishable])
  end

  def load_contribution
    @contribution = Contribution.find(params[:id])
  end

  def restrict_access
    render :status => 403, :text => "Forbidden User Access" unless current_user.id == params[:user_id].to_i && current_user.type == "Provider"
  end
end
