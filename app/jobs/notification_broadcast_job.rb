class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(channel, user_id, message)
    Rails.logger.info("Broadcasting to channel: #{channel}, user_id: #{user_id}, message: #{message}")
    ActionCable.server.broadcast(channel, user_id: user_id, message: message)
  end

  def self.schedule_medication_notification(medication)
    user_id = medication.user_id
    Rails.logger.info("Scheduling notification for user_id: #{user_id}")
    set(wait_until: medication.start_time).perform_later("notification_channel_#{user_id}", "Time to take your medication: #{medication.name}")
  end
end
