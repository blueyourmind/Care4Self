class RemoveStartTimeFromMedications < ActiveRecord::Migration[7.1]
  def change
    remove_column :medications, :start_time
  end
end
