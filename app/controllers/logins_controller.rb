class LoginsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    user = params[:user_id]
    if user
      session[:current_user_id] = user
    end
    redirect_to user_path(user)
  end

  def destroy

  end
end
