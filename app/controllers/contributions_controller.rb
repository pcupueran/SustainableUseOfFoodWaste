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
    @contributions = Contribution.joins(:user).where("users.id =?", params[:user_id])
  end

  def add_product
    Product.new
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
