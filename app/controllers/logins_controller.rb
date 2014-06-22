class LoginsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    if user = params[:user_id]
      session[:current_user_id] = user
    end
    redirect_to user_path(user)
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path, notice: 'You have successfully logged out.'
  end
end
