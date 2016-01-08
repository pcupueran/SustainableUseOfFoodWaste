class RemoveProviderIdFromContributions < ActiveRecord::Migration
  def change
    remove_column :contributions, :provider_id, :integer
  end
end
