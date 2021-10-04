class RenameCheckboxColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :life_id, :like_life_id
    rename_column :users, :it_id, :like_it_id
    rename_column :users, :area_id, :like_area_id
    rename_column :users, :science_id, :like_science_id
    rename_column :users, :sports_id, :like_sports_id
    rename_column :users, :entertainment_id, :like_entertainment_id
    rename_column :users, :economy_id, :like_economy_id
  end
end
