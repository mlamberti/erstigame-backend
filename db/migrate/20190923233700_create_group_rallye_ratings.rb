class CreateGroupRallyeRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :group_rallye_ratings do |t|
      t.references :group, foreign_key: true
      t.references :rallye_rating, foreign_key: true

      t.timestamps
    end
  end
end
