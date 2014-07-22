require 'rails_helper'

describe TodoList do
  it 'has a valid factory' do
    expect(create(:todo_list)).to be_valid
  end

  it 'is invalid without a title' do
    expect(build(:todo_list, title: nil)).to be_invalid
  end
end
