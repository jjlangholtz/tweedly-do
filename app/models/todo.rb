class Todo < ActiveRecord::Base
  belongs_to :todo_list
  belongs_to :user

  validates :title, presence: true,
                    length: { maximum: 30 }
  validates :notes, length: { maximum: 140 }

  scope :complete, -> { where(complete: true) }
  scope :incomplete, -> { where(complete: false) }
end
