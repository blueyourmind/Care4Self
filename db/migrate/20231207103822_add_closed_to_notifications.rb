class AddClosedToNotifications < ActiveRecord::Migration[7.1]
  def change
    add_column :notifications, :closed, :boolean
  end
end
