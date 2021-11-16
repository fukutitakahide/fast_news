class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    t.boolean :like_area_id
      t.boolean :like_life_id
      t.boolean :like_science_id
      t.boolean :like_it_id
      t.boolean :like_sports_id
      t.boolean :like_entertainment_id
      t.boolean :like_economy_id
      
      t.string :name
      t.string :password
    
      t.timestamps
    end
  end
end
