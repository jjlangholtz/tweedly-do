class TodoListsController < ApplicationController
  def index
    @user = User.find(session[:current_user_id])
    @todo_lists = @user.todo_lists
    @todos = @user.todos.where(complete: [nil, false] )
  end

  def new
    @user = User.find(session[:current_user_id])
    @list = TodoList.find(params[:user_id])
    @todo_lists = @user.todo_lists
    @todos = @user.todos.where(complete: [nil, false] )
  end

  def create
    @user = User.find(session[:current_user_id])
    @list = @user.todo_lists.create(todo_list_params)
    redirect_to user_todo_lists_path(@user)
  end

  def edit
    @user = User.find(session[:current_user_id])
    @todo_lists = @user.todo_lists
    @list = TodoList.find(params[:id])
    @todos = @list.todos.where(complete: [nil, false] )
  end

  def update
    @list = TodoList.find(params[:id])
    if @list.update(todo_list_params)
      redirect_to @list
    else
      render 'edit'
    end
  end

  def destroy
    @list = TodoList.find(params[:id])
    @list.destroy
    redirect_to @list
  end

  private
    def todo_list_params
      params.require(:todo_list).permit(:title, todos_attributes: [:complete, :id])
    end
end
