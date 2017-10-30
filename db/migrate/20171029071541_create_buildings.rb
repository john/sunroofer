class CreateBuildings < ActiveRecord::Migration[5.1]
  def change
    create_table :buildings do |t|
      t.references :roof_set, foreign_key: true
      t.string :name
      t.string :slug
      t.text :description
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.float :latitude
      t.float :longitude
      t.string :sunroof_url
      t.string :sunroof_ajax_url
      t.integer :roof_sq_feet
      t.integer :sunlight_hours
      t.string :utility
      t.integer :gnis_id

      t.timestamps
    end
    
    add_index :buildings, :name
  end
end