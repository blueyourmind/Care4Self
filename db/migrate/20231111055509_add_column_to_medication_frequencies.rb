class AddColumnToMedicationFrequencies < ActiveRecord::Migration[7.1]
  def change
    add_column :medication_frequencies, :has_taken?, :boolean
    add_column :medication_frequencies, :start_time, :timestamp
  end
end
