class AddColumnToMedications < ActiveRecord::Migration[7.1]
  def change
    add_column :medications, :name, :text
    add_column :medications, :instruction, :string
    add_column :medications, :duration, :integer
    add_column :medications, :quantity, :integer
    add_column :medications, :med_type, :string
    add_column :medications, :start_date, :timestamp
    add_column :medications, :end_date, :timestamp

  end
end
