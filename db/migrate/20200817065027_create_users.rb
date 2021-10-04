class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :area_id
      t.integer :life_id
      t.integer :science_id
      t.integer :it_id
      t.integer :sports_id
      t.integer :entertainment_id
      t.integer :economy_id
      
      t.string :name
      t.string :email
      
      t.timestamps
    end
  end
end
