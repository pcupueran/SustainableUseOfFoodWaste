class ContributionsController < ApplicationController
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


  def show
    @contribution = Contribution.find(params[:id])
  end

  def index
    @contributions = Contribution.all

    @charity_as_json = current_user.as_json
    @providers_as_json = Contribution.providers_as_json(Provider.joins(:contributions).limit(5))

  end

  def add_product
    Product.new
  end

  def search
    @addresses =Address.joins(:profile => :user).where("users.type = ?", "Provider")
    unless params[:distance].nil?
      @addresses = @addresses.near([current_user.profile.address.latitude, current_user.profile.address.longitude], params[:distance], :units => :km)
    end

    @contributions = []
    @providers = []
    @addresses.each do |address|
      @contribution = Contribution.joins(:user).where("users.id = ?", address.profile.user_id)
      @contributions << @contribution[0]
      @providers << Provider.find(address.profile.user_id)
    end

    @coordinates_json = current_user.profile.address.to_json(:except => %i(id created_at updated_at))
    @providers = Contribution.providers_as_json(@providers)
  end

  private
  def contribution_params
    params.require(:contribution).permit(:collection_date, :collection_time, :products_attributes => [:quantity, :product_name, :perishable])
  end
end
