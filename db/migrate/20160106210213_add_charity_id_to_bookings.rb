class AddCharityIdToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :charity_id, :integer
  end
end
