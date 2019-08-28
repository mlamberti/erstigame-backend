class CreateLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :levels do |t|
      t.integer :level
      t.integer :num_hours
      t.integer :num_places
      t.integer :num_sponsors
      t.integer :num_catches

      t.timestamps
    end
  end
end
