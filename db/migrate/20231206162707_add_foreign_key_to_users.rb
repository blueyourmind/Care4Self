class AddForeignKeyToUsers < ActiveRecord::Migration[7.1]
  def change
    unless foreign_key_exists?(:users, :recipient_id)
      add_foreign_key :users, :notifications, column: :recipient_id
    end
  end

  def foreign_key_exists?(table, column)
    foreign_keys = ActiveRecord::Base.connection.foreign_keys(table)
    foreign_keys.any? { |fk| fk.column == column.to_s }
  end
end
