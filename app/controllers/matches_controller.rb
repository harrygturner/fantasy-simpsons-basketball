class MatchesController < ApplicationController
  before_action :require_login, :find_user
  #before_action :show, :find_match
  @@game_played = nil

  def playgame
    game = Match.find(params[:match_id])
    game.score
    game.highest_scorer
    game.save
    @@game_played = params[:game_played]
    redirect_to match_path(game)
  end

  def show
    find_match
    @hometeam = @match.team.team_players
    @awayteam = @match.away_team.team_players
    @played = @@game_played
  end

  def create
    byebug
    @hometeam = @user.team
    @awayteam = Team.find(params[:away_team])
    @match = Match.create(team_id: @hometeam.id, team_id_2: params[:away_team])
    redirect_to match_path(@match)
  end

  private

  def find_match
    @match = Match.find(params[:id])
  end

  def find_user
    @user = User.find(session[:user_id])
  end
end
