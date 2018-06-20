class ModifyCityColumnNameInCreateChef < ActiveRecord::Migration
  def change
    rename_column :chefs, :city, :city_id
  end
end
