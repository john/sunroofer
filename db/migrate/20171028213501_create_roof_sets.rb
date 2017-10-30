class CreateRoofSets < ActiveRecord::Migration[5.1]
  def change
    create_table :roof_sets do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.text :csv_data

      t.timestamps
    end
  end
end
