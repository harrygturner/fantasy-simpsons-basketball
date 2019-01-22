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

  # Returns true if the user is logged in, false otehrwise
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    session.destroy
    @current_user = nil
  end

end
