class Todo < ActiveRecord::Base
  belongs_to :todo_list
  belongs_to :user

  validates :title, presence: true,
                    length: { maximum: 30 }

  scope :complete, -> { where(complete: true) }
  scope :incomplete, -> { where.not(complete: true) }

  def overdue?
    due < Date.current
  end
end
