class User < ApplicationRecord
  has_one :team

  validates :username, uniqueness: true
  validates :name, presence: true

  has_secure_password
  
end
