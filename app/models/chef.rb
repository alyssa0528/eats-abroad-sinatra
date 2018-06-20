class Chef < ActiveRecord::Base
  has_secure_password
  
  belongs_to :city
  has_many :chefrestaurant
  has_many :restaurants, through: :chefrestaurant
end
