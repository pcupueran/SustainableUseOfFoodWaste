class AddContributionIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :contribution_id, :integer
  end
end
