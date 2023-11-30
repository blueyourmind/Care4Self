class AddReminderRequiredToMedications < ActiveRecord::Migration[7.1]
  def change
    add_column :medications, :reminder_required, :boolean
  end
end
