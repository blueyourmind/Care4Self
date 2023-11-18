class Reminder < ApplicationRecord
  has_many :medication_frequencies
  validates :description, presence: true
  validates :pre_alarm_time, presence: true
  validates :alarm_time, presence: true
  validates :alarm_duration, presence: true
  validates :has_taken, inclusion: { in: [true, false] }
end
