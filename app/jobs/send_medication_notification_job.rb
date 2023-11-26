# app/jobs/medication_notification_job.rb
class SendMedicationNotificationJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    # Check if it's time to send the notification
    if user.scheduled_medication_time - 2.minutes <= Time.current
      TestNotification.with(post: "It's time to take your medication", user_id: user.id, med_type: "Tablets").deliver(user)
    end
  end
end
