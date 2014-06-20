class TodosController < ApplicationController
  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @list = TodoList.find(params[:todo_list_id])
  end

  def create
    @list = TodoList.find(params[:todo_list_id])
    @todo = @list.todos.create(todo_params)
    redirect_to user_path(@list)
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update
      redirect_to @todo
    else
      render 'edit'
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to @todo
  end
end

  private
  def todo_params
    params.require(:todo).permit(:title, :due, :notes, :todo_list_id, :user_id)
  end
