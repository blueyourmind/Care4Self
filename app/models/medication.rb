class Medication < ApplicationRecord
  after_create :schedule_medication_notification
  belongs_to :user
  belongs_to :interval

  has_many :medication_frequencies, dependent: :destroy
  has_many :notification
  validates :name, presence: true
  validates :instruction, presence: true
  validates :quantity, presence: true
  validates :med_type, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :frequency, presence: true
  validates :start_time, presence: true


  private

  def schedule_medication_notification
    scheduled_time = start_date.to_datetime + start_time.seconds_since_midnight.seconds
    SendMedicationNotificationJob.set(wait_until: scheduled_time).perform_later(user_id, id)
  end


end
