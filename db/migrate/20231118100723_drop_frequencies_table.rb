class DropFrequenciesTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :frequencies, force: :cascade
  end

  def down
    create_table :frequencies do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.text "name"
      t.string "description"
      t.integer "value"
    end
  end
end
