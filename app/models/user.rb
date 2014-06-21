class User < ActiveRecord::Base
  has_many :todo_lists
  has_many :todos, through: :todo_lists, dependent: :destroy

  validates :name, presence: true,
                   uniqueness: true,
                   length: { minimum: 5, maximum: 30 },
                   format: { with: /\A[a-zA-Z]+\z/,
                             message: 'only allows letters' }
end
