class CreateRallyeStations < ActiveRecord::Migration[5.2]
  def change
    create_table :rallye_stations do |t|
      t.string :tag, null: false, unique: true
      t.string :name, null: false, unique: true
      t.string :token, null: false, unique: true
      t.timestamps
    end
  end
end
