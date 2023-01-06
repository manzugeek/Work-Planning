class Shift < ApplicationRecord
  belongs_to :worker

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :slot, presence: true
  validate :validate_shift_time_frame
  
  SHIFTS = {
    "0-8" => 1,
    "8-16" => 2,
    "16-24" => 3
  }

  private

  def validate_shift_time_frame
    # Get the start and end times for the shift
    shift_start_time = Time.zone.at(start_at).beginning_of_day + start_at.hours
    shift_end_time = Time.zone.at(end_at).beginning_of_day + end_at.hours

    # Check if the start and end times fall within a 8-hour time frame
    if shift_end_time - shift_start_time > 8.hours
      errors.add(:start_at, "shift must be 8 hours or less")
    end
  end
end

