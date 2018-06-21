class Chef < ActiveRecord::Base
  has_secure_password

  has_many :comments
  has_many :restaurants, through: :comments


  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

end
