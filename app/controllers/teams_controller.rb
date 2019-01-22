class TeamsController < ApplicationController

  before_action :require_login
  
  def new
    @team = Team.new
    @players = Player.all
    
  end

  def create
    @team = Team.create(team_params)
    byebug
    redirect_to team_path(@team)
  end
  
  def show
    @team = Team.find(params[:id])
  end

  private

  def find_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :user_id)
  end
end
