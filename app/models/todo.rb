class Todo < ActiveRecord::Base
  belongs_to :todo_list
  belongs_to :user

  validates :title, presence: true
  validates :notes, presence: true,
                    length: { maximum: 140 }
# validates :due_date
  validates :todo_list, presence: true
  validates :user, presence: true
end
