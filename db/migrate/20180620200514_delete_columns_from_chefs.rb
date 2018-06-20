class DeleteColumnsFromChefs < ActiveRecord::Migration
  def change
    remove_column :chefs, :city
    remove_column :chefs, :title
    remove_column :chefs, :employer
  end
end
