class DeleteCommentsColumnFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :comments
  end
end
