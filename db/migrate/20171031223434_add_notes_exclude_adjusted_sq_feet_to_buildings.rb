class AddNotesExcludeAdjustedSqFeetToBuildings < ActiveRecord::Migration[5.1]
  def change
    add_column :buildings, :exclude, :boolean
    add_column :buildings, :notes, :text
    add_column :buildings, :adjusted_sq_feet, :integer
    add_column :buildings, :installed_kw, :float
  end
end
