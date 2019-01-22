class TeamPlayer < ApplicationRecord
  belongs_to :team
  belongs_to :player
  before_save :default_values

  def name
    self.player.name
  end

  def modifier
    modifier = 0.0
    case rating
    when 0..20
      modifier = rand(0.2)
    when 21..30
      modifier = rand(0.3)
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


  private

  def default_values
    self.rating = self.player.baserating
  end
end
