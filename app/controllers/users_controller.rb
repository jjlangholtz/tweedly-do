class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @todos = @user.todos
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end
end
