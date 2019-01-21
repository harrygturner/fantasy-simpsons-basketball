class Team < ApplicationRecord
  belongs_to :user
  has_many :players
  has_many :players, through: :team_players
  has_many :matches
end
