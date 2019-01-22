class PlayersController < ApplicationController
  before_action :require_login   
  private

  def find_player
    @player = Player.find(params[:id])
  end
end
