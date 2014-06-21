class Todo < ActiveRecord::Base
  default_scope { where complete: false }

  belongs_to :todo_list
  belongs_to :user

  validates :title, presence: true,
                    length: { maximum: 30 }
  validates :notes, length: { maximum: 140 }
  validate :due_date_cannot_be_in_the_past

  def due_date_cannot_be_in_the_past
    if due.present? && due < DateTime.now
      errors.add(:due, "can't be in the past")
    end
  end

  def self.complete
    self.where(complete: true)
  end

  def self.incomplete
    self.where(complete: false)
  end
end
