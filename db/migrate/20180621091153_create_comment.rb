class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :chef_id
      t.integer :restaurant_id
    end
  end
end
