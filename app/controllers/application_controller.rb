class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def require_login
    redirect_to login_path unless session.include? :user_id
  end

end
