class AddUserIdToBuildings < ActiveRecord::Migration[5.2]
  def up
    add_column :buildings, :user_id, :integer, after: :id
    if Building.first.present?
      user_id = Building.first.id
      execute "UPDATE buildings SET user_id=#{user_id};"
    end
  end
  
  def down
    remove_column :buildings, :user_id
  end
end
