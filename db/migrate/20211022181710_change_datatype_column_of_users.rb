class ChangeDatatypeColumnOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :like_life_id, 'boolean USING CAST(column_name AS boolean)'
    change_column :users, :like_area_id, 'boolean USING CAST(column_name AS boolean)'
    change_column :users, :like_science_id, 'boolean USING CAST(column_name AS boolean)'
    change_column :users, :like_it_id, 'boolean USING CAST(column_name AS boolean)'
    change_column :users, :like_sports_id, 'boolean USING CAST(column_name AS boolean)'
    change_column :users, :like_entertainment_id, 'boolean USING CAST(column_name AS boolean)'
    change_column :users, :like_economy_id, 'boolean USING CAST(column_name AS boolean)'
  end
end
