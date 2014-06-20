class Todo < ActiveRecord::Base
  belongs_to :todo_list
  belongs_to :user

  validates :title, presence: true
  validates :notes, length: { maximum: 140 }
end
