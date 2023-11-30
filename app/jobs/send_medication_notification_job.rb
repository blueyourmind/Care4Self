class SendMedicationNotificationJob < ApplicationJob
  queue_as :default

  def perform(user_id, medication_name, scheduled_at = nil)
    user = User.find(user_id)
    medication = Medication.find_by(name: medication_name)

    # Customize your notification message
    notification_message = "Time to take your medication: #{medication_name} - #{user.name}"

    # Use the scheduled_at parameter as needed
    if scheduled_at.nil?
      Rails.logger.info("No scheduled time provided for #{medication_name} - #{user.name}")
    else
      Rails.logger.info("Scheduled time for #{medication_name} - #{user.name}: #{scheduled_at}")
    end

    # Rest of your notification logic...
  rescue ActiveRecord::RecordNotFound
    # Handle the case where either user or medication is not found
    Rails.logger.error("User with ID #{user_id} or Medication with name #{medication_name} not found.")
  end
end
