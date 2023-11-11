class AddColumnToFrequencies < ActiveRecord::Migration[7.1]
  def change
    add_column :frequencies, :name, :text
    add_column :frequencies, :description, :string
    add_column :frequencies, :value, :integer
  end
end
