class ContributionsController < ApplicationController
  def new
    @contribution = Contribution.new
    @contribution.products << Product.new
  end

  def create
    binding.pry
    @contribution = Contribution.new(user_id: params[:user_id])
    @contribution.assign_attributes(contribution_params)
    @contribution.save!
    redirect_to user_contribution_path(@contribution)
  end

  def show
    @contribution = Contribution.find(params[:id])
  end
  def add_product
    binding.pry
    Product.new
  end

  private
  def contribution_params
    params.require(:contribution).permit(:products_attributes => [:quantity, :product_name, :perishable])
  end
end
