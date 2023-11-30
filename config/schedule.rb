every 1.hour do
  runner "MedicationReminderService.check_and_notify_due_medications"
end
