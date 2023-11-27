class AddScheduledAtToNotifications < ActiveRecord::Migration[7.1]
  def change
    add_column :notifications, :scheduled_at, :datetime
  end
end
