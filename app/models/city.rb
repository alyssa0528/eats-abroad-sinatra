class City < ActiveRecord::Base
  has_many :chefs
  has_many :restaurants, through: :chefs
end
