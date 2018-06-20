class DeleteCityIdFromChefs < ActiveRecord::Migration
  def change
    remove_column :chefs, :city_id
  end
end
