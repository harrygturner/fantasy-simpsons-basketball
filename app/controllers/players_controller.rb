class PlayersController < ApplicationController
  before_action :require_login
  before_action :find_player, only: [:show]


  def index
    @players = Player.all
  end
  
  private

  def find_player
    @player = Player.find(params[:id])
  end
end
