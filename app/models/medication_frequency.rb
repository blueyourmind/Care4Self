class MedicationFrequency < ApplicationRecord
  belongs_to :medication
  belongs_to :frequency
  has_many :reminders
end
