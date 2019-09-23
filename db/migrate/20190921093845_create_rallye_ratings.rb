class CreateRallyeRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :rallye_ratings do |t|
      t.references :rallye_station, foreign_key: true, null: false
      t.integer :points, null: false
      t.string :token, null: false

      t.timestamps
    end
  end
end
