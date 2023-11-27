class RemoveRecipientIdFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :recipient_id, :integer
  end
end
