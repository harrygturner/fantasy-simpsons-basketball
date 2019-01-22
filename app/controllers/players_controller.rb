class PlayersController < ApplicationController
  before_action :require_login
  before_action :find_player, only: [:show]

  def selectplayers
    @user = User.find(session[:user_id])
    @team = @user.team
    @players = Player.all
    
    if @team.players.count == 0
      @players = Player.all
    else
      @players = Player.all.reject { |player| @team.players.include?(player) }
      # byebug
    end
    @players
  end

  def show

  end
  def index
    @players = Player.all
  end

  def addplayer
    @user = User.find(session[:user_id])
    TeamPlayer.create(team_id: @user.team.id, player_id: params[:player_id])
    # byebug
    redirect_to selectplayers_path
  end

  private

  def find_player
    @player = Player.find(params[:id])
  end
end
