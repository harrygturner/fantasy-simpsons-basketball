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

  def highest_average_score
    p1 = self.team_players.max_by { |player| player.average_score }
    p1
  end

  def most_baskets
    p1 = self.team_players.max_by { |player| player.totalbaskets }
    p1
  end

  def total_matches
    t1 = self.matches.count
  end

  def highest_score
    self.matches.max_by { |x| x.baskets_team_1 }
  end
end
