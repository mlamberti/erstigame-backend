class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.references :group, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.string :path, null: false
      t.datetime :date, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.integer :people_count, null: false, default: 0

      t.timestamps
    end
    add_index :photos, :path, unique: true
  end
end
