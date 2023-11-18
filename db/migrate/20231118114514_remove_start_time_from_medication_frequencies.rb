class RemoveStartTimeFromMedicationFrequencies < ActiveRecord::Migration[7.1]
  def change
    remove_column :medication_frequencies, :start_time, :time
  end
end
