class Team < ApplicationRecord
  belongs_to :user
  has_many :team_players
  has_many :players, through: :team_players
  has_many :matches

  def teammodifier
    teamtotal = 0
    self.team_players.each do |player|
      teamtotal += player.rating
    end
    (teamtotal / self.team_players.count) / 2
  end
end
