class ChangeBuildingsInstalledKw < ActiveRecord::Migration[5.1]
  def change
    change_column :buildings, :installed_kw, :integer
  end
end
