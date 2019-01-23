class Player < ApplicationRecord
  has_many :team_players
  has_many :teams, through: :team_players

  def value
    self.baserating/3
  end
end
