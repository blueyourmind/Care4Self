class DropMedicationModificationsTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :medication_modifications, force: :cascade
  end

  def down
    create_table :medication_modifications do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.date "modification_date"
      t.bigint "medication_frequency_id", null: false
      t.integer "value"
    end
  end
end
