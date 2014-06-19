class TodoListsController < ApplicationController
  before_action :verify_logged_in, only: [:new, :create, :edit, :update, :destroy]

  def show

  end

  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @list = @user.todo_lists.create(todo_list_params)
    redirect_to user_path(@user)
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
    def todo_list_params
      params.require(:todo_list).permit(:title, :user_id)
    end
end
