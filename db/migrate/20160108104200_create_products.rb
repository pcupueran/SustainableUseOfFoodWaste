class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :quantity
      t.string :product_name
      t.boolean :perishable

      t.timestamps null: false
    end
  end
end
