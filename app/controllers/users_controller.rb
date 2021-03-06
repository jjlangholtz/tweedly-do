class UsersController < ApplicationController
  layout 'home', only: :new

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
      session[:current_user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
