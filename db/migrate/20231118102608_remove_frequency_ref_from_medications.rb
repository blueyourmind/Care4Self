class RemoveFrequencyRefFromMedications < ActiveRecord::Migration[7.1]
  def up
    remove_column :medications, :frequency_id
  end

  def down
    add_column :medications, :frequency_id, :bigint, null: false
  end
end
