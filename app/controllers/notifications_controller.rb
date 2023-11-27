class NotificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :send_notification_if_needed

  def index
    @notifications = Notification.where(recipient: current_user)

 end
 # Inside a controller action
 
  def create
    # Your logic to create a notification
    message = "New notification message!"

    # Broadcast the message to the channel
    ActionCable.server.broadcast("notifications_channel", message: message)
  end

end
