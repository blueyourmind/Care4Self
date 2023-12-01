class NotificationsController < ApplicationController
  before_action :authenticate_user!
  notifications = Notification.all



  def index
    notifications = Notification.all

 render json: notifications, content_type: 'application/json'
  end

  def create
    @medication = Medication.find(params[:medication_id])
    message = " It's Time to take your #{@medication.med_type} of #{@medication.name}"
    create_medication_notification(message, current_user.id, @medication)
    schedule_medication_notification(@medication)
  end




def destroy
  if notification_destroy_logic
    head :no_content
  else
    render json: { error: 'Unable to delete notifications' }, status: :unprocessable_entity
  end
end

private

  def create_medication_notification(user_id,message)
    notification = current_user.notifications.build(message: message, recipient_id: current_user.id)

    if notification.save
      NotificationBroadcastJob.perform_later("notification_channel_#{current_user.id}", current_user.id, message)
    else
      handle_notification_creation_error(notification)
    end
  end

  def handle_notification_creation_error(notification)
    flash[:alert] = "Notification couldn't be saved: #{notification.errors.full_messages.join(', ')}"
    Rails.logger.error(flash[:alert])
  end
end
