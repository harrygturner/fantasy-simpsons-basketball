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

  def current_budget
    total = self.budget
    player_total = 0
    self.team.players.each do |player|
      player_total += player.value
    end
    c_b = total - player_total
  end

end
