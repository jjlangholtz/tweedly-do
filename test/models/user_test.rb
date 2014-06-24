require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users

  test "user name must not be empty" do
    user = User.new

    assert user.invalid?
    assert user.errors[:name].any?
  end

  test "user is not valid without a unique name" do
    user = User.new(name: users(:josh).name)

    assert user.invalid?
    assert_equal ["has already been taken"], user.errors[:name]
  end

  test "user name is only valid with letters" do
    user = User.new(name: 1337)

    assert user.invalid?
    assert_equal ["only allows letters"], user.errors[:name]
  end
end
