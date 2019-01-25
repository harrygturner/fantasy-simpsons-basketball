class MatchesController < ApplicationController
  before_action :require_login, :find_user
  #before_action :show, :find_match
  @@game_played = nil
  @@game_location = nil

  def playgame
    @game = Match.find(params[:match_id])
    if @game.team.players.count < 5 || @game.away_team.players.count < 5
      flash[:team_not_full] = "Your team doesn't have enough people!"
      redirect_to match_path(@game)
    else
      @game.score
      @game.highest_scorer
      @game.save
      @@game_played = params[:game_played]
      # redirect_to match_path(@game)
      render "sim"
    end
  end

  def show
    find_match
    @hometeam = @match.team.team_players
    @awayteam = @match.away_team.team_players
    @location = @@game_location
    if params[:played] == "1"
      @played = "true"
    else
      @played = @@game_played
    end
  end

  def create
    @hometeam = @user.team
    @awayteam = Team.find(params[:away_team])
    @match = Match.create(team_id: @hometeam.id, team_id_2: params[:away_team])
    @@game_played = params[:game_played]
    @@game_location = Faker::Simpsons.location
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
