class ChangeColumnInAddressesTable < ActiveRecord::Migration
  def change
    rename_column :addresses, :user_id, :profile_id
  end
end
