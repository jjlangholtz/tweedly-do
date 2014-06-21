class TodoList < ActiveRecord::Base
  has_many :todos
  belongs_to :user
  accepts_nested_attributes_for :todos

  validates :title, presence: true,
                    uniqueness: { scope: :user },
                    length: { maximum: 30 },
                    format: { with: /\A[a-zA-Z]+\z/,
                              message: 'only allows letters' }
  validates :user, presence: true
  validates_associated :todos
end
