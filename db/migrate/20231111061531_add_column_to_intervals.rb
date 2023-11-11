class AddColumnToIntervals < ActiveRecord::Migration[7.1]
  def change
    add_column :intervals, :name, :string
    add_column :intervals, :value, :integer
  end
end
