class RemoveFrequencyRefToMedicationFrequencies < ActiveRecord::Migration[7.1]
  def up
    remove_column :medication_frequencies, :frequency_id
  end

  def down
    add_column :medication_frequencies, :frequency_id, :bigint, null: false
  end
end
