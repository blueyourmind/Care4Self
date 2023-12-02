class RemoveUserReferencesFromNotifications < ActiveRecord::Migration[7.1]
  def change
    remove_reference :notifications, :user
  end
end
