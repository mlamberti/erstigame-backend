class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.string :path
      t.datetime :date
      t.integer :people_count

      t.timestamps
    end
    add_index :photos, :path, unique: true
  end
end
