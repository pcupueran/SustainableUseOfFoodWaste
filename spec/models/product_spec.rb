require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Product" do
    before do
      @email = Faker::Internet.email
      @provider = User.create!(organization_name: "Pret a manger", email: @email, password: "password", type: "Provider")
      @product_1 = Product.new(quantity: 3, product_name: "Tuna cans", perishable: "0")
      @product_2 = Product.new(quantity: 5, product_name: "Chicken sandwiches", perishable: "1")
      Contribution.create!(user: @provider, contribution_products_attributes: [
        {product: @product_1},
        {product: @product_2}
      ])
    end

    it "belongs to a contribution" do
      expect(Contribution.first.products.length).to eq(2)
      expect(Product.all.length).to eq(2)
    end

    it "is created when a contribution is created" do
      expect(Contribution.all.length).to eq(1)
      expect(Contribution.first.user.organization_name).to eq("Pret a manger")
      expect(Product.first.quantity).to eq(3)
      expect(Product.first.perishable).to eq(false)
      expect(Product.first.product_name).to eq("Tuna cans")
      expect(Product.second.quantity).to eq(5)
      expect(Product.second.product_name).to eq("Chicken sandwiches")
      expect(Product.second.perishable).to eq(true)
    end
  end
end
