class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :send_medication_reminders

  def configure_permitted_parameters
  
  end

  def service_worker_js
    render 'service_worker.js', content_type: 'application/javascript'
  end



  private

  def send_medication_reminders

    medications_to_remind = Medication.where(reminder_required: true)


    if medications_to_remind.any?

      medications_to_remind.each do |medication|
        send_medication_reminder(medication)
      end
    else

      redirect_to medications_url, notice: 'No medications require reminders.'
    end
  end



  # def send_medication_reminder_notification(medication)
  #   # Logic to send the notification
  #   notification = Notification.new(category: 'medication_reminder').with(params: { medication_id: medication.id })
  #   notification.deliver(User.find(medication.user_id))
  # end
end
