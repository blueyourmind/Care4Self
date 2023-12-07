class AddRecipientIdToNotifications < ActiveRecord::Migration[7.1]
  def change
    add_column :notifications, :recipient_id, :integer
  end
end
