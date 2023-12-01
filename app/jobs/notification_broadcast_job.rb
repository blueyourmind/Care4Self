# app/jobs/notification_broadcast_job.rb
class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(channel, user_id, message)
    ActionCable.server.broadcast( user_id, message)
  end


def self.schedule_medication_notification(medication)
  set(wait_until: medication.start_time).perform_later("notification_channel_#{medication.user_id}", medication.user_id, "Time to take your medication: #{medication.name}")
end
end
