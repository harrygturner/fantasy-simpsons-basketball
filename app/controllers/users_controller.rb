class UsersController < ApplicationController
  require "rack-flash"
  before_action :find_user, only: %i[show edit update]


  def index
  end

  def new
    @user = User.new
    render layout: "_login"
  end

  def show
    @team = @user.team
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      flash[:success] = "Welcome to the Simpson Fantasy Basketball League"
      log_in @user
      redirect_to @user
    else
      flash.now[:errors] = @user.errors.full_messages
      render "new"
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      @user.update(user_params)
      flash[:update] = "Your changes have been successfully updated!"
      redirect_to user_path
    else
      flash[:errors] = @user.errors.full_messages
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
