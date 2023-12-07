class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :phone_number, :integer unless column_exists?(:users, :phone_number)
    add_column :users, :family_phone_number, :integer unless column_exists?(:users, :family_phone_number)
    add_column :users, :photo, :string unless column_exists?(:users, :photo)
    add_column :users, :user_type, :string unless column_exists?(:users, :user_type)
  end
end
