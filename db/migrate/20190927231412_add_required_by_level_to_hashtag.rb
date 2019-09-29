class AddRequiredByLevelToHashtag < ActiveRecord::Migration[5.2]
  def change
    add_reference :hashtags, :required_by_level
    add_foreign_key :hashtags, :levels, column: :required_by_level_id, primary_key: :id
  end
end
