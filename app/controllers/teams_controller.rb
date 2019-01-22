class TeamsController < ApplicationController
  before_action :require_login
  
  private

  def find_team
    @team = Team.find(params[:id])
  end
end
