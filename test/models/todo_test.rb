require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  test "todo title must not be empty" do
    todo = Todo.new

    assert todo.invalid?
    assert todo.errors[:title].any?
  end

  test "new todos are not complete" do
    todo = Todo.new

    assert_equal false, todo.complete
  end

  test "todos due before today are overdue" do
    todo = Todo.new(due: Date.yesterday)

    assert todo.overdue?
  end

  test "todos due today are not overdue" do
    todo = Todo.new(due: Date.current)

    refute todo.overdue?
  end
end
