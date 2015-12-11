class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
    @user = User.find_by(params[:id])
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    # @user = current_user
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to users_path
    end
  end
end
