class RemoveRecipientIdFromNotifications < ActiveRecord::Migration[7.1]
  def change
    remove_column :notifications, :recipient_id
  end
end
