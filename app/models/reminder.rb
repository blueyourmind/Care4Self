class Reminder < ApplicationRecord
  belongs_to :medication_frequency
  validates :description, presence: true
  validates :pre_alarm_time, presence: true
  validates :alarm_time, presence: true
  validates :alarm_duration, presence: true
  validates :has_taken, presence: true
end
