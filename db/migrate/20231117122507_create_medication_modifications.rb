class CreateMedicationModifications < ActiveRecord::Migration[7.1]
  def change
    create_table :medication_modifications do |t|
      t.references :medication_frequency, null: false, foreign_key: true
      t.date :modification_date

      t.timestamps
    end
  end
end
