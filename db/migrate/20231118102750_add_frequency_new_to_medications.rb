class AddFrequencyNewToMedications < ActiveRecord::Migration[7.1]
  def change
    add_column :medications, :frequency, :string
  end
end
