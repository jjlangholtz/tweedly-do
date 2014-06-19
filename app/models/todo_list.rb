class TodoList < ActiveRecord::Base
  has_many :todos
  belongs_to :user

  validates :title, presence: true
  validates :user, presence: true
end
