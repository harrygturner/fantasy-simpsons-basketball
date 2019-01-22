class UsersController < ApplicationController
  require "rack-flash"
  before_action :require_login

  def index
  end

  def new
    @user = User.new
  end

  def show
    find_user
    @team = @user.team
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      flash[:success] = "Welcome to the Simpson Fantasy Basketball League"
      redirect_to @user
    else
      flash.now[:errors] = @user.errors.full_messages
      render 'new'
    end
  end

  def edit
    find_user
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
