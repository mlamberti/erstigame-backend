class CreateRallyeStations < ActiveRecord::Migration[5.2]
  def change
    create_table :rallye_stations do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
