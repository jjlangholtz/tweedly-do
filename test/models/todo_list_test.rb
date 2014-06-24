require 'test_helper'

class TodoListTest < ActiveSupport::TestCase
  fixtures :todo_lists

  test "todo list title must not be empty" do
    todo_list = TodoList.new

    assert todo_list.invalid?
    assert todo_list.errors[:title].any?
  end

  test "todo list is not valid without a unique title" do
    todo_list = TodoList.new(title: todo_lists(:clean).title)

    assert todo_list.invalid?
    assert_equal ["has already been taken"], todo_list.errors[:title]
  end
end
