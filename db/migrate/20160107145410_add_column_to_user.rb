class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :organization_name, :string
  end
end
