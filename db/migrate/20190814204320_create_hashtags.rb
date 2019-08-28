class CreateHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtags do |t|
      t.string :name, null: false
      t.string :info
      t.text :description
      t.string :picture
      t.integer :points, null: false, default: 100
      t.time :repeat_time

      t.timestamps
    end
  end
end
