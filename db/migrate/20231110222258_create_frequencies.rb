class CreateFrequencies < ActiveRecord::Migration[7.1]
  def change
    create_table :frequencies do |t|

      t.timestamps
    end
  end
end
