class User < ApplicationRecord

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true,
                      length: { in: 5..20}

  has_one :team

end
