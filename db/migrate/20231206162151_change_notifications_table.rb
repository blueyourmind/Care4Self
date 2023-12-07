class ChangeNotificationsTable < ActiveRecord::Migration[7.1]
  def up
    # Remove old columns
    remove_foreign_key_if_exists :notifications, :users, column: :user_id

    # Remove foreign key for medication_id if it exists
    remove_foreign_key :notifications, :medications if foreign_key_exists?(:notifications, :medication_id)

    # Add new polymorphic columns if they don't exist
    unless column_exists?(:notifications, :recipient_id) && column_exists?(:notifications, :recipient_type)
      add_reference :notifications, :recipient, polymorphic: true, null: false
    end

    # Remove any existing foreign key constraints
    remove_column :notifications, :user_id if column_exists?(:notifications, :user_id)
    remove_column :notifications, :medication_id if column_exists?(:notifications, :medication_id)
  end

  def down
    # Revert the changes if needed
    add_foreign_key :notifications, :users, column: :user_id

    # Add foreign key for medication_id if it existed before
    add_foreign_key :notifications, :medications, column: :medication_id if foreign_key_exists?(:notifications, :medication_id)

    # Remove new columns
    remove_reference :notifications, :recipient, polymorphic: true
  end

  private

  def remove_foreign_key_if_exists(table, to_table, options = {})
    if foreign_key_exists?(table, options[:column])
      remove_foreign_key table, options
    end
  end

  def foreign_key_exists?(table, column)
    foreign_keys = ActiveRecord::Base.connection.foreign_keys(table)
    foreign_keys.any? { |fk| fk.column == column.to_s }
  end
end
