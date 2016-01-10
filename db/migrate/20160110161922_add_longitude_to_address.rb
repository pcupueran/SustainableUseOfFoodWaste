class AddLongitudeToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :longitude, :decimal
  end
end
