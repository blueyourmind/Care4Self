class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @medication = Medication.find(params[:medication_id])
    message = "Medication successfully created: #{@medication.name}"
    create_medication_notification(message)
  end

  private

  def create_medication_notification(message)
    notification = current_user.notifications.build(message: message, recipient_id: current_user.id)

    if notification.save
      
    NotificationBroadcastJob.perform_later('notifications_channel', "Time to take your #{@medication.name}")



    else
      flash[:alert] = "Notification couldn't be saved: #{notification.errors.full_messages.join(', ')}"
      Rails.logger.error(flash[:alert])
    end
  end
end
