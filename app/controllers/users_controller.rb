class UsersController < ApplicationController
  before_action :verify_logged_in, only: [:new, :create, :edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save

    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end
end
