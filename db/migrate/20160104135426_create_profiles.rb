class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :organization_name

      t.timestamps null: false
    end
  end
end
