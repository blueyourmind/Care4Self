class RemoveHasTakenFromMedicationFrequencies < ActiveRecord::Migration[7.1]
  def change
    remove_column :medication_frequencies, :has_taken?
  end
end
