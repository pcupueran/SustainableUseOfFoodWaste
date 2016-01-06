class AddBookingIdToContribution < ActiveRecord::Migration
  def change
    add_column :contributions, :booking_id, :integer
  end
end
