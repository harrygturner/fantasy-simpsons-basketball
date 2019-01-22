class MatchesController < ApplicationController
  before_action :require_login


  private

  def find_match
    @match = Match.find(params[:id])
  end
end
