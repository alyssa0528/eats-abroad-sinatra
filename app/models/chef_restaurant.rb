class ChefRestaurant < ActiveRecord::Base
  
  belongs_to :chef
  belongs_to :restaurant
end
