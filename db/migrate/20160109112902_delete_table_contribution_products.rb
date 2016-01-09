class DeleteTableContributionProducts < ActiveRecord::Migration
  def change
    drop_table :contribution_products
  end
end
