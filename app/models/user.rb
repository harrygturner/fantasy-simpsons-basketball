class User < ApplicationRecord
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, length: {in: 5..20}
  has_secure_password

  has_one :team

  def first_name
    name_array = self.name.split()
    f_n = name_array.first
  end

end
