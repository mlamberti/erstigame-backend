class CreateJoinTablePhotosHashtags < ActiveRecord::Migration[5.2]
  def change
    create_join_table :photos, :hashtags do |t|
      t.index [:photo_id, :hashtag_id]
      t.index [:hashtag_id, :photo_id]
    end
  end
end
