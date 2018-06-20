class Restaurant < ActiveRecord::Base
  has_many :chefs_restaurants
  has_many :chefs, through: :chefs_restaurants
  belongs_to :city
end
