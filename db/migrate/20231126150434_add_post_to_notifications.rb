class AddPostToNotifications < ActiveRecord::Migration[7.1]
  def change
    add_column :notifications, :post, :string
  end
end
