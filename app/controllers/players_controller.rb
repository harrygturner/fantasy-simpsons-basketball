class PlayersController < ApplicationController
  before_action :require_login
  before_action :find_player, only: [:show]
  before_action :find_user

  def selectplayers
    if params[:team_create]
      team = Team.create(name: params[:name], user_id: session[:user_id])
    end

    @team = @user.team
    @players = Player.all

    if @team.players.count == 0
      @players = Player.all
    else
      @players = Player.all.reject { |player| @team.players.include?(player) }
      # byebug
    end
    @players
    render :layout => "_header_team"
  end

  def show
  end

  def index
    @players = Player.all
  end

  def addplayer
    @team = @user.team
    player = TeamPlayer.new(team_id: @user.team.id, player_id: params[:player_id])

    if @user.current_budget - player.value < 0
      flash[:error] = "You can't afford him, sorry!"
      redirect_to selectplayers_path
    elsif @team.players.count < 5 && @user.current_budget >= 0
      player.save
    # byebug
      redirect_to selectplayers_path
    elsif @team.players.count == 5
      flash[:error] = "You squad is full!"
      redirect_to user_path(@user)
    end
  end

  def removeplayer
    t_p = TeamPlayer.find_by(player_id: params[:player_id])
    t_p.destroy
    redirect_to edit_team_path(@user.id)
  end

  private

  def find_player
    @player = Player.find(params[:id])
  end

  def find_user
    @user = User.find(session[:user_id])
  end

end
