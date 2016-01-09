class AddColumnToContribution < ActiveRecord::Migration
  def change
    add_column :contributions, :collection_date, :date
  end
end
