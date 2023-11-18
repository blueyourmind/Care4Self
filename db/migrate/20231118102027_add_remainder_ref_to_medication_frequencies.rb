class AddRemainderRefToMedicationFrequencies < ActiveRecord::Migration[7.1]
  def change
    add_reference :medication_frequencies, :reminder, foreign_key: true
  end
end
