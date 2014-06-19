class User < ActiveRecord::Base
  has_many :todos, through: :todo_lists

  validates :name, presence: true,
                   uniqueness: true,
                   length: { minimum: 5 }
end
