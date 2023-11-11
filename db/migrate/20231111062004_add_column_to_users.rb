class AddColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :text
    add_column :users, :phone_number, :integer
    add_column :users, :family_phone_number, :integer
  end
end
