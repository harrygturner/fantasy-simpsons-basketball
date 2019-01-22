class MatchesController < ApplicationController
  before_action :require_login, :find_user


  private

  def find_match
    @match = Match.find(params[:id])
  end

  def find_user
    @user = User.find(session[:user_id])
  end

end
