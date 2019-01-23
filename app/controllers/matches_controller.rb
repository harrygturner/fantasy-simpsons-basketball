class MatchesController < ApplicationController
  before_action :require_login, :find_user
  #before_action :show, :find_match

  def show
    @match = Match.find(params[:id])
    @hometeam = @match.team.team_players
    @awayteam = @match.away_team.team_players
  end

  private

  def find_match
    @match = Match.find(params[:id])
  end

  def find_user
    @user = User.find(session[:user_id])
  end
end
