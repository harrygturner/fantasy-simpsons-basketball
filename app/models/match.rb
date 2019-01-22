class Match < ApplicationRecord
  belongs_to :team

  def away_team
    Team.find(self.team_id_2)
  end

  def home_baskets
    teammod = self.team.teammodifier
    team_baskets = {}
    self.team.team_players.each do |player|
      team_baskets[player.name] = (player.modifier * teammod).to_i
    end
    team_baskets
  end

  def away_baskets
  end
end
