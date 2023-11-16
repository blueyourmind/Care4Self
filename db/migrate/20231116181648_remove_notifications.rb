# db/migrate/YYYYMMDDHHMMSS_remove_notifications.rb
class RemoveNotifications < ActiveRecord::Migration[7.1]
  def change
    drop_table :notifications
  end
end
