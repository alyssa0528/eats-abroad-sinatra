class CreateRestaurant < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :cuisine
      t.integer :city_id
    end
  end
end
