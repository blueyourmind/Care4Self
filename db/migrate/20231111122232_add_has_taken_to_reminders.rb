class AddHasTakenToReminders < ActiveRecord::Migration[7.1]
  def change
    add_column :reminders, :has_taken, :boolean, default: false
  end
end
