class TeamsController < ApplicationController
  before_action :find_user
  before_action :find_team, only: %i[edit show]
  before_action :require_login

  def new
    @team = Team.new
    @players = Player.all
  end

  def create
    @team = Team.create(team_params)
    redirect_to team_path(@team)
  end

  def show
  end

  def edit
    @players = @team.players
  end

  private

  def find_team
    @team = Team.find_by(user_id: params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :user_id)
  end

  def find_user
    @user = User.find(session[:user_id])
  end
end
