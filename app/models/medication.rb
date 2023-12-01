# app/models/medication.rb
class Medication < ApplicationRecord
  validates :name, presence: true
  validates :med_type, presence: true
  validates :quantity, presence: true
  validates :instruction, presence: true
  validates :frequency, presence: true
  validates :start_time, presence: true
  validates :interval, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  # validates :medication_frequency, presence: true
  # validates :medication_interval, presence: true
  has_many :medication_frequencies, dependent: :destroy
  accepts_nested_attributes_for :medication_frequencies
  belongs_to :interval
  belongs_to :user
  has_many :medication_frequencies, dependent: :destroy
  accepts_nested_attributes_for :medication_frequencies

  # after_create :schedule_medication_notification



  private

  def schedule_medication_notification(user_id)
    create_medication_notification("Medication successfully created: #{name}")
  end
end
