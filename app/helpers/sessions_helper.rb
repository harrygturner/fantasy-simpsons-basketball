module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

end
