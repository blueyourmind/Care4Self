class AddRecipientToNotifications < ActiveRecord::Migration[7.1]
  def change
    add_reference :notifications, :recipient, null: false, foreign_key: true
  end
end
