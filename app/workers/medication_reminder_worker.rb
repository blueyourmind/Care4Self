# app/workers/medication_reminder_worker.rb
class MedicationReminderWorker
  include Sidekiq::Worker

  def perform(user_id, medication_name)
    user = User.find_by(id: user_id)
    if user.present?
      scheduled_time = user.scheduled_medication_time&.is_a?(Numeric) ? Time.zone.at(user.scheduled_medication_time) : nil

      if medication_time_reached?(scheduled_time)
        send_medication_notification(user, medication_name)
      else
        puts "It's not time for #{medication_name} yet."
      end
    else
      puts "User not found with ID #{user_id}."
    end
  end

  private

  def medication_time_reached?(scheduled_time)
    # Add your logic to determine if it's time for medication
    # For example, you can compare the scheduled_time with the current time
    scheduled_time.present? && Time.zone.now >= scheduled_time
  end

  def send_medication_notification(user, medication_name)
    notification = TestNotification.with(user_id: user.id, medication_name: medication_name)
    notification.deliver
    puts "Reminder: Take #{medication_name} now!"
  end
end
