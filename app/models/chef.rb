class Chef < ActiveRecord::Base
  has_secure_password
  
  has_many :restaurants, through: :comments
  has_many :comments

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

end
