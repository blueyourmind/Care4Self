class AddStartTimeToMedications < ActiveRecord::Migration[7.1]
  def change
    add_column :medications, :start_time, :datetime
  end
end
