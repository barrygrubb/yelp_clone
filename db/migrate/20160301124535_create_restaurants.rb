class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :ratinger
      t.string :something

      t.timestamps null: false
    end
  end
end
