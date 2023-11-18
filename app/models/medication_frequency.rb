class MedicationFrequency < ApplicationRecord
  belongs_to :medication
  has_many :reminders, dependent: :destroy
  validates :start_time, presence: true
end
