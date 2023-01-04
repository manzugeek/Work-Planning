class Shift < ApplicationRecord
  belongs_to :worker

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :shift_length
  validates_timeliness :start_time, on: :create, on_or_before: Time.now.beginning_of_day, 
              on_or_before_message: "must start at 0, 8, or 16 hours"
  validates_timeliness :end_time, on: :create, on_or_after: Time.now.beginning_of_day + 8.hours,
               on_or_after_message: "must end at 8, 16, or 24 hours"
 

  def shift_length
    if end_time - start_time != 28800
      errors.add(:shift, "must be at least 8 hours after the start time")
    end
  end

end
