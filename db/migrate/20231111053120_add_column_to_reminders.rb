class AddColumnToReminders < ActiveRecord::Migration[7.1]
  def change
    add_column :reminders, :description, :text
    add_column :reminders, :pre_alarm_time, :timestamp
    add_column :reminders, :alarm_time, :timestamp
    add_column :reminders, :alarm_duration, :integer
  end
end
