class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @todos = @user.todos.order(:complete)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end
end
