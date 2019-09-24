class AddCategoryToHashtag < ActiveRecord::Migration[5.2]
  def change
    add_column :hashtags, :category, :integer
  end
end
