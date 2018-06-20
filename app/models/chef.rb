class Chef < ActiveRecord::Base
  has_secure_password

  has_many :chefs_restaurants
  has_many :restaurants, through: :chefs_restaurants

  validates :name, presence: true 
  validates :email, presence: true
  validates :email, uniqueness: true

end
