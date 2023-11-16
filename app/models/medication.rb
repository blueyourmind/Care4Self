class Medication < ApplicationRecord
  belongs_to :user
  belongs_to :interval
  has_many :medication_frequencies, inverse_of: :medication, dependent: :destroy
  has_many :frequencies, through: :medication_frequencies
  accepts_nested_attributes_for :medication_frequencies
  accepts_nested_attributes_for :interval

  validates :name, format: {with: /[a-zA-Z]/}, presence: true
  validates :instruction, presence: true
  # validates :duration, presence: true
  validates :quantity, presence: true
  validates :med_type, presence: true
  # validates :start_date, presence: true
  # validates :end_date, presence: true
  validates :user_id, presence: true
end
