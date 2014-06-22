class TodoList < ActiveRecord::Base
  has_many :todos, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :todos

  validates :title, presence: true,
                    uniqueness: { scope: :user },
                    length: { maximum: 30 }
  validates :user, presence: true
  validates_associated :todos
end
