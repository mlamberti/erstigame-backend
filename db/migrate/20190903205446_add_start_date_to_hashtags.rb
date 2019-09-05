class AddStartDateToHashtags < ActiveRecord::Migration[5.2]
  def change
    add_column :hashtags, :start_date, :datetime, null: true
  end
end
