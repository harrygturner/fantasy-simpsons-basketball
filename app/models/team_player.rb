class TeamPlayer < ApplicationRecord
  belongs_to :team
  belongs_to :player
  before_create :default_values

  def name
    self.player.name
  end

  def value
    self.rating/3
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

  def total_games
    self.team.matches.count
  end

  # def total_away_games
  #   matches = []
  #   Match.all.each do |match|
  #     if match.team_id_2 == self.team.id
  #       matches << match
  #     end
  #   end
  #   matches.count
  # end

  # def total_games
  #   self.total_home_games + self.total_away_games
  # end

  def average_score
    average = 0
    #total_games = total_home_games + total_away_games
    total_baskets = self.totalbaskets
    average = total_baskets/self.total_games
  end

  def experience
    rating = self.rating
    difference = self.matchbaskets - self.average_score
    case rating
    when 92..100
      if difference > 0
        experience = difference/4
      else
        experience = difference*2
      end
    when 80..91
      if difference > 0
        experience = difference/3
      else
        experience = difference*1.5
      end
    when 60..79
      if difference > 0
        experience = difference/2
      else
        experience = difference
      end
    when 40..59
      if difference > 0
        experience = difference
      else
        experience = difference/2
      end
    when 0..39
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
