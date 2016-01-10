class AddLatitudeToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :latitude, :decimal
  end
end
