class PlayersController < ApplicationController
  private

  def find_player
    @player = Player.find(params[:id])
  end
end
