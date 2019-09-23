class CreateJoinTableRallyeRatingsGroup < ActiveRecord::Migration[5.2]
  def change
    create_join_table :rallye_ratings, :groups do |t|
      t.index [:rallye_rating_id, :group_id]
      t.index [:group_id, :rallye_rating_id]
    end
  end
end
