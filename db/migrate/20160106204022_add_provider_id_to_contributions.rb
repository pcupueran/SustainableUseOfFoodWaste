class AddProviderIdToContributions < ActiveRecord::Migration
  def change
    add_column :contributions, :provider_id, :integer
  end
end
