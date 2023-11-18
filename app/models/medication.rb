class Medication < ApplicationRecord
  # attr_accessor :days
  belongs_to :user
  belongs_to :interval



  has_many :medication_frequencies, dependent: :destroy

  validates :name, presence: true
  validates :instruction, presence: true
  # validates :duration, presence: true
  validates :quantity, presence: true
  validates :med_type, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :frequency, presence: true
end
