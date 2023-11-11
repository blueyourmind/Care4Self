class CreateMedicationFrequencies < ActiveRecord::Migration[7.1]
  def change
    create_table :medication_frequencies do |t|
      t.references :medication, null: false, foreign_key: true
      t.references :frequency, null: false, foreign_key: true

      t.timestamps
    end
  end
end
