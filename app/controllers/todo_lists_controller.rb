class TodoListsController < ApplicationController
  def show
    @list = TodoList.find(params[:id])
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
    @list = TodoList.find(params[:id])
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
