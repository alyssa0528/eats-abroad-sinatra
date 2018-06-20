class CreateChef < ActiveRecord::Migration
  def change
    create_table :chefs do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :city
      t.string :title
      t.string :employer
    end 
  end
end
