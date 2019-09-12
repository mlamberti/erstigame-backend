class RemovePathFromPhotos < ActiveRecord::Migration[5.2]
  def change
    remove_column :photos, :path
  end
end
