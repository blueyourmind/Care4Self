# app/jobs/notification_broadcast_job.rb

class NotificationBroadcastJob < ApplicationJob
  def perform(channel, message)
    ActionCable.server.broadcast(channel, message)
  end
end
