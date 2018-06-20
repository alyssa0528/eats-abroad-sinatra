class UpdateColumnDataTypeInCreateChef < ActiveRecord::Migration
  def change
    change_column :chefs, :city_id, :integer
  end
end
