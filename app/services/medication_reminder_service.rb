# app/services/medication_reminder_service.rb
class MedicationReminderService
  def self.check_and_notify_due_medications
    Medication.where('scheduled_time <= ?', Time.current).each do |medication|
      notify_medication_due(medication.user_id, medication.name)
    end
  end

  def self.notify_medication_due(user_id, medication_name)
    TestWorker.perform_async(user_id, medication_name)
  end
end
