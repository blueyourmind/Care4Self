class CreateReminders < ActiveRecord::Migration[7.1]
  def change
    create_table :reminders do |t|
      t.references :medication_frequency, null: false, foreign_key: true

      t.timestamps
    end
  end
end
