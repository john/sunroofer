class AddBuiltAtToBuildings < ActiveRecord::Migration[5.2]
  def change
    add_column :buildings, :built_at, :datetime
  end
end
