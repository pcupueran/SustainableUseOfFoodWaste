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
  end

  def add_product
    Product.new
  end

  def search
    @contributions = []
    @addresses =Address.joins(:profile => :user).where("users.type = ?", "Provider")
    unless params[:distance].nil?
      @addresses = @addresses.near([current_user.profile.address.latitude, current_user.profile.address.longitude], params[:distance], :units => :km)
    end
    @addresses.each do |address|
      @contr = Contribution.joins(:user).where("users.id = ?", address.profile.user_id)
      @contributions << @contr[0]
    end
  end

  private
  def contribution_params
    params.require(:contribution).permit(:collection_date, :collection_time, :products_attributes => [:quantity, :product_name, :perishable])
  end

end
