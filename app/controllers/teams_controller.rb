class TeamsController < ApplicationController
  private

  def find_team
    @team = Team.find(params[:id])
  end
end
