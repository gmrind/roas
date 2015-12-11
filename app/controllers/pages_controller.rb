class PagesController < ApplicationController
  def home
    @user = current_user
  end

  def about
    @user = current_user
    @users = User.all
  end

  def contact
  end

  def news
  end

  def help
  end
end
