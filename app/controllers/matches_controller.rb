class MatchesController < ApplicationController



  private

  def find_match
    @match = Match.find(params[:id])
  end
end
