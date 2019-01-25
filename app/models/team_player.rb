class TeamPlayer < ApplicationRecord
  belongs_to :team
  belongs_to :player
  before_create :default_values

  def name
    self.player.name
  end

  def value
    self.player.value
  end

  def modifier
    modifier = 0.0
    case rating
    when 0..20
      modifier = rand(0..0.2)
    when 21..30
      modifier = rand(0..0.3)
    when 31..40
      modifier = rand(0.2..0.4)
    when 41..50
      modifier = rand(0.3..0.5)
    when 51..60
      modifier = rand(0.4..0.6)
    when 61..70
      modifier = rand(0.5..0.7)
    when 71..80
      modifier = rand(0.6..0.8)
    when 81..90
      modifier = rand(0.7..0.9)
    when 91..100
      modifier = rand(0.8..1)
    end
    modifier
  end

  def total_home_games
    self.team.matches.count
  end

  def total_away_games
    matches = []
    Match.all.each do |match|
      if match.team_id_2 == self.team.id
        matches << match
      end
    end
    matches.count
  end

  def average_score
    average = 0
    total_games = total_home_games + total_away_games
    total_baskets = self.totalbaskets
    average = total_baskets/total_games
  end

  def experience
    rating = self.rating
    difference = self.matchbaskets - self.average_score
    if rating >= 80
      if difference > 0
        experience = difference/2
      else
        experience = difference
      end
    elsif rating >= 50 && rating < 80
      if difference > 0
        experience = difference/1.5
      else
        experience = difference/2
      end
    else
      if difference > 0
        experience = difference*2
      else
        experience = 0
      end
    end
    experience.to_i
  end

  private

  def default_values
    self.rating = self.player.baserating
  end
end
