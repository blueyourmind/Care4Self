class AddMedicationIdToNotifications < ActiveRecord::Migration[7.1]
  def change
    add_column :notifications, :medication_id, :integer unless column_exists?(:notifications, :medication_id)
    add_index :notifications, :medication_id, name: "index_notifications_on_medication_id" unless index_exists?(:notifications, :medication_id)
  end
end
