class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  rescue_from ActiveRecord::RecordNotFound do |exception|
    if logged_in? == true
      redirect_to "/users/#{session["user_id"]}"
    else
      redirect_to "/login"
    end
  end

  def authorized_for(target_user_id)
    if current_user.id != target_user_id.to_i
      flash[:authorized] = "You cannot view a page that does not belong to you! Please login again to continue."
      session.destroy
      redirect_to login_path
    end
  end

  private

  def require_login
    redirect_to login_path and return unless session.include? :user_id
  end
end
