class MatchesController < ApplicationController
  before_action :require_login, :find_user
  #before_action :show, :find_match

  def playgame
    @match = Match.find(params[:match_id])
    @hometeam = @match.team.team_players
    @awayteam = @match.away_team.team_players
  end

  def show
    # byebug
    find_match
    @hometeam = @match.team
    @awayteam = @match.away_team 
  end

  def create
    @hometeam = @user.team
    @awayteam = Team.find(params[:away_team])
    @match = Match.create(team_id: @hometeam.id, team_id_2: @awayteam.id)
    redirect_to match_path(@match)
    # byebug
  end

  private

  def find_match
    @match = Match.find(params[:id])
  end

  def find_user
    @user = User.find(session[:user_id])
  end
end
