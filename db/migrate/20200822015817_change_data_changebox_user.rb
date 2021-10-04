class ChangeDataChangeboxUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :life_id, :boolean
    change_column :users, :area_id, :boolean
    change_column :users, :science_id, :boolean
    change_column :users, :it_id, :boolean
    change_column :users, :sports_id, :boolean
    change_column :users, :entertainment_id, :boolean
    change_column :users, :economy_id, :boolean
  end
end
