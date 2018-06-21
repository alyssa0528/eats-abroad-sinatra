class Restaurant < ActiveRecord::Base
  has_many :comments
  has_many :chefs, through: :comments
  belongs_to :city
end
