class Comment < ActiveRecord::Base
  belongs_to :chef
  belongs_to :restaurant
end
