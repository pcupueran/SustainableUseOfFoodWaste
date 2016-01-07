class RemoveColumnFromProfile < ActiveRecord::Migration
  def change
    remove_column :profiles, :organization_name, :string
  end
end
