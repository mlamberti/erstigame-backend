class AddPointsToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :points, :integer, null: false, default: 0
  end
end
