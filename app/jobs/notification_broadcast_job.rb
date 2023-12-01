# app/jobs/notification_broadcast_job.rb
class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(channel, user_id, message)
    ActionCable.server.broadcast( user_id, message)
  end
end


# def perform(item) # this method dispatch when job is called
#   item.user_ids.each do |user_id|
#     Notification.create(item: item, user_id: user_id)
#   end
# end
