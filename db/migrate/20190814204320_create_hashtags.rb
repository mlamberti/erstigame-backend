class CreateHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtags do |t|
      t.string :name
      t.text :description
      t.string :picture
      t.integer :points
      t.boolean :repeatable
      t.time :repeat_time

      t.timestamps
    end
  end
end
