class Restaurant < ActiveRecord::Base
  has_many :chefrestaurant
  has_many :chefs, through: :chefrestaurant
  belongs_to :city
end
