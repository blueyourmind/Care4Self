class TestWorker
  # include Sidekiq::Worker

  # def perform(user_id, medication_name, notification_message)
  #   user = User.find(user_id)
  #   notification = Notification.new(
  #     user: user,
  #     recipient: user,
  #     message: notification_message
  #   )

  #   if notification.save
  #     Rails.logger.info("Notification saved successfully!")
  #     ActionCable.server.broadcast("notifications_channel", message: notification_message)
  #   else
  #     Rails.logger.error("Error saving notification: #{notification.errors.full_messages.join(', ')}")
  #   end
  # end
end
