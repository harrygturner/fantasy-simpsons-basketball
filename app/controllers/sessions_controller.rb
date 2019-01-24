class SessionsController < ApplicationController
  layout "_login"

  def new
    byebug
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:valid] = "Welcome back #{user.first_name}"
      # Log the user in and redirect to the user's show page
      log_in user
      redirect_to user
    else
      #   Create an error message
      flash.now[:invalid] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end

end
