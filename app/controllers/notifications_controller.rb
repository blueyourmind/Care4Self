class NotificationsController < ApplicationController
  before_action :authenticate_user!
  # before_action :send_notification_if_needed

  def index
    @notifications = Notification.where(recipient: current_user)

 end


  def create

    message = "New notification message!"

    # Broadcast the message to the channel
    ActionCable.server.broadcast("notifications_channel", message: message)
  end

end
