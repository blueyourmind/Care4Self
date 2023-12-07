class AddTakenToNotifications < ActiveRecord::Migration[7.1]
  def change
    add_column :notifications, :taken, :boolean, default: false
  end
end
