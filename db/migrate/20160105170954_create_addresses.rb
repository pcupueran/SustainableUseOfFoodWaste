class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :door_number
      t.string :street
      t.string :city
      t.string :country
      t.string :postcode
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
