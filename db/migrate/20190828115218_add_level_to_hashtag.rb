class AddLevelToHashtag < ActiveRecord::Migration[5.2]
  def change
    change_table :hashtags do |t|
      t.references :level, foreign_key: true, null: true
    end
  end
end
