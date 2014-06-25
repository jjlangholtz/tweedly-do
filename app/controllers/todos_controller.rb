class TodosController < ApplicationController
  def new
    @user = User.find(session[:current_user_id])
    @todos = @user.todos.order(:complete)
  end

  def create
    @user = User.find(session[:current_user_id])
    @list = @user.todo_lists.find_by_title('Uncategorized') || @user.todo_lists.create(title: 'Uncategorized')
    @todo = @list.todos.create(todo_params)
    redirect_to user_path(@user)
  end

  def edit
    @user = User.find(session[:current_user_id])
    @todo = Todo.find(params[:id])
    @lists = @user.todo_lists
    @todos = @user.todos.order(:complete)
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to edit_todo_path(@todo)
    else
      render 'edit'
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to @todo
  end

  def toggle
    @user = User.find(session[:current_user_id])
    @todo = Todo.find(params[:id])

    if @todo.update(complete: params[:complete])
      render json: @todo
    else
      render nothing: true
    end
  end
end

  private
  def todo_params
    params.require(:todo).permit(:title, :due, :notes, :todo_list_id, :user_id, :complete)
  end
