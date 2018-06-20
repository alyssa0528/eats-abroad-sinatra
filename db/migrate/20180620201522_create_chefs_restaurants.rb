class CreateChefsRestaurants < ActiveRecord::Migration
  def change
    create_table :chefs_restaurants do |t|
      t.integer :chef_id
      t.integer :restaurant_id
    end 
  end
end
