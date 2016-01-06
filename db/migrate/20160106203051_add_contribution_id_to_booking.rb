class AddContributionIdToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :contribution_id, :integer
  end
end
