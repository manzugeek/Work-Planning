class Worker < ApplicationRecord
  
  validates :title, presence: true
  validates :dept, presence: true
  validate  :no_overlapping_shifts

  belongs_to :user
  has_many :shifts

  def no_overlapping_shifts
    # Get all shifts for this worker on the same day
    worker_shifts = shifts.where("start_at BETWEEN ? AND ?", Date.today.beginning_of_day, Date.today.end_of_day)

    # Check if there is more than one shift on the same day
    if worker_shifts.count > 1
      errors.add(:shifts, "cannot overlap")
    end
  end
end
