class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :send_medication_reminders

  def configure_permitted_parameters
    # Your devise controller configuration logic goes here
  end

  def service_worker_js
    render 'service_worker.js.erb', content_type: 'application/javascript'
  end

  # private
  # def send_medication_reminders
  #   # Check if any medication requires a reminder 5 minutes before the start time
  #   medications_to_remind = Medication.where('start_time > ? AND start_time <= ?', Time.now, 5.minutes.from_now)

  #   medications_to_remind.each do |medication|
  #     send_medication_reminder_notification(medication)
  #   end
  # end

  # def send_medication_reminder_notification(medication)
  #   # Logic to send the notification
  #   notification = Notification.new(category: 'medication_reminder').with(params: { medication_id: medication.id })
  #   notification.deliver(User.find(medication.user_id))
  # end
end
