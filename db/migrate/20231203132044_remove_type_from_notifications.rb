class RemoveTypeFromNotifications < ActiveRecord::Migration[7.1]
  def change
    remove_column :notifications, :type
  end
end
