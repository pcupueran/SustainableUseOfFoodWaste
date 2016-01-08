class ContributionsController < ApplicationController
  def new
    @contribution = Contribution.new
    @contribution.products << Product.new
  end

  def create
    @contribution = Contribution.new(user_id: params[:user_id])
    @contribution.assign_attributes(contribution_params)
    @contribution.save!
    flash[:notice] = "A contribution has been created"
    redirect_to user_contribution_path(@contribution, user_id: params[:user_id])
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

  private
  def contribution_params
    params.require(:contribution).permit(:products_attributes => [:quantity, :product_name, :perishable])
  end

end
