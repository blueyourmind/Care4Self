class AddRecipientTypeToNotifications < ActiveRecord::Migration[7.1]
  def change
    add_column :notifications, :recipient_type, :string
  end
end
