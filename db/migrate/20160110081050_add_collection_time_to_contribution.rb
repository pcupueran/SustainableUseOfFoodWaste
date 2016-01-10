class AddCollectionTimeToContribution < ActiveRecord::Migration
  def change
    add_column :contributions, :collection_time, :time
  end
end
